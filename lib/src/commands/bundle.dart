import 'package:mason_coder/mason_coder.dart';
import 'package:mason_coder/src/commands/base.dart';
import 'package:mason_coder/src/publisher/publisher.dart';
import 'package:path/path.dart' as path;
import 'package:promptly/promptly.dart';
import 'package:universal_io/io.dart';

class BundleCommand extends BaseCommand {
  BundleCommand({String? name, String? description})
      : super(
          name ?? 'bundle',
          description ?? 'Make a bundle for publishing',
        );

  @override
  Future<int> run() async {
    header(name, message: description);
    final tpl = TemplateYaml.load();
    final bundleFile = File(path.join(Constants.bundleFolder, tpl.bundleName));
    if (!bundleFile.existsSync()) {
      error('Sorry i can\'t find brick folder `${tpl.bundleName}`.');
      final lines = '''
before bundle command you have to run:
- ${'mason_coder create'.yellow()}
''';
      for (final line in lines.split('\n')) {
        verbose(line);
      }

      line();
      info(brickFile.path);
      line();
      return finishWithError('/$name/', message: 'No bricks found');
    }

    final progress = processing('Bundling brick...');
    final publisher = Publisher(console, tpl, '');
    await publisher.create();
    await publisher.generate();
    await Future.delayed(Duration(seconds: 2));
    progress.success('Brick bundled');
    return finishSuccesfuly('/$name/', message: 'complete');
  }
}
