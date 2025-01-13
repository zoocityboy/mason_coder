import 'dart:convert';

import 'package:archive/archive_io.dart';
import 'package:mason/mason.dart' hide StringCaseExtensions;
import 'package:mason_coder/mason_coder.dart';
import 'package:path/path.dart' as path;
import 'package:promptly/promptly.dart';
import 'package:universal_io/io.dart';

part 'publisher.mason.dart';

class Publisher {
  Publisher(this.console, this.tpl, this.bundlePassword);
  final Console console;
  final TemplateYaml tpl;
  final String bundlePassword;
  Future<void> create() async {
    console.writeMessage('Publisher.create');
    console.writeMessage('directory: ${tpl.target}');
    console.writeMessage('target: ${tpl.target}');
    final bundleProgress = console.processing('Generating bundle');
    final bundle = createBundle(Directory(tpl.target));
    final bundleGenerator = _BrickUniversalBundleGenerator(
      outputDirectoryPath: tpl.bundleRootPath,
      bundle: bundle,
    );
    await bundleGenerator.generate();
    bundleProgress.success('Generated 1 file.');
    final bundlePath = canonicalize(bundleGenerator.bundleFile.path);
    info('Bundle created at $bundlePath');
  }

  Future<void> generate() async {
    final targetFolder = File(path.join(
      Directory.current.path,
      Constants.bundleFolder,
    ));
    final content = File(
      path.join(
        Directory.current.path,
        Constants.bundleFolder,
        tpl.bundleName,
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

    final bundleFile = File(path.join(targetFolder.path, tpl.bundleName));
    final metaFile = File(path.join(targetFolder.path, '${tpl.name}.meta.json'));
    final zipedFile = File(path.join(targetFolder.path, '${tpl.name}+${data['version']}.zip'));

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
      error(e.toString());
    }
  }
}
