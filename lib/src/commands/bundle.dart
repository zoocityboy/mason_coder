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
          category: 'Manage',
        );

  @override
  Future<int> run() async {
    header(name, message: description);
    final tpl = TemplateYaml.load();
    final bundleFile = File(path.join(Constants.bundleFolder, tpl.bundleName));
    final brickFile = File(path.join(Constants.brickFolder, 'brick.yaml'));
    if (!brickFile.existsSync()) {
      error('Sorry i can\'t find brick.yaml in `${brickFile.path}`.');
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

    if (!bundleFile.existsSync()) {
      final progress = processing('Creating bundled brick...');
      final publisher = Publisher(console, tpl, '');
      await publisher.create();
      progress.success('Brick `${tpl.name}` bundled');
    }

    final progress = processing('Preparing for publishing...');
    final publisher = Publisher(console, tpl, '');
    await publisher.generate();
    await Future.delayed(Duration(seconds: 2));
    progress.success('Brick `${tpl.name}` is ready for publishing');
    return finishSuccesfuly('/${tpl.bundleName}/', message: 'completed, you can now publish your brick');
  }
}
