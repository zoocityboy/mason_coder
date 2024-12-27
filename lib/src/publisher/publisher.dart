import 'dart:convert';

import 'package:archive/archive_io.dart';
import 'package:mason/mason.dart';
import 'package:mason_coder/src/data/config/template_yaml.dart';
import 'package:mason_coder/src/logger.dart';
import 'package:path/path.dart' as path;
import 'package:universal_io/io.dart';

part 'publisher.crate.dart';
part 'publisher.mason.dart';

class Publisher {
  Publisher(this.logger, this.tpl, this.bundlePassword);
  final Console logger;
  final TemplateYaml tpl;
  final String bundlePassword;
  Future<void> create() async {
    final bundleProgress = logger.progress('Generating bundle');
    final bundle = createBundle(Directory(tpl.brickRootPath));
    final bundleGenerator = _BrickUniversalBundleGenerator(
      outputDirectoryPath: tpl.target,
      bundle: bundle,
    );
    await bundleGenerator.generate();
    bundleProgress.success('Generated 1 file.');
    final bundlePath = canonicalize(bundleGenerator.bundleFile.path);
    logger.info('Bundle created at $bundlePath');
  }

  Future<void> generate() async {
    final content = File(
      path.join(
        Directory.current.path,
        tpl.target,
        '${tpl.name}.bundle',
      ),
    ).readAsBytesSync();

    final x = await MasonBundle.fromUniversalBundle(content);
    final data = x.toJson();
    final metaJson = {
      'name': data['name'] as String,
      'description': data['description'] as String,
      'version': data['version'] as String,
      'vars': data['vars'] as Map,
    };

    final bundleFile = File(path.join(Directory.current.path, tpl.target, '${tpl.name}.bundle'));
    final metaFile = File(path.join(Directory.current.path, tpl.target, '${tpl.name}.meta.json'));
    final zipedFile = File(path.join(Directory.current.path, tpl.target, '${tpl.name}+${data['version']}.zip'));

    if (metaFile.existsSync()) metaFile.deleteSync();
    metaFile.createSync();
    File(metaFile.path).writeAsStringSync(jsonEncode(metaJson));

    // final encoder = ZipFileEncoder(password: bundlePassword)
    final encoder = ZipFileEncoder()
      ..create(
        zipedFile.path,
        level: Deflate.BEST_SPEED,
        modified: DateTime.now(),
      );
    await encoder.addFile(bundleFile);
    await encoder.addFile(metaFile);
    encoder.closeSync();

    bundleFile.copySync(path.join(tpl.target, '${tpl.name}.bundle'));
    metaFile.copySync(path.join(tpl.target, '${tpl.name}.meta.json'));
    zipedFile.copySync(path.join(tpl.target, '${tpl.name}-v${data['version']}.zip'));
  }

  Future<void> publish(
    String name,
    String version,
    File file,
  ) async {
    const accessToken = '19d09834464b8d08fbb25fd5c6b5fbe9ca2c4379';
    try {
      await Process.run(
        'curl',
        [
          '-H',
          'Authorization: token $accessToken',
          '--upload-file',
          file.path,
          'https://gitea-lccokso848ks08gog80skw4k.zoocityboy.space/api/packages/zoolab/generic/$name/$version/${path.basename(file.path)}',
        ],
      );
    } catch (e) {
      logger.error(e.toString());
    }
  }
}
