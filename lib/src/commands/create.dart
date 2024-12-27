import 'package:mason/mason.dart';
import 'package:mason_coder/mason_coder.dart';
import 'package:mason_coder/src/commands/base.dart';
import 'package:mason_coder/src/commands/bundle.dart';
import 'package:mason_coder/src/data/brick/creator.dart';
import 'package:path/path.dart';
import 'package:universal_io/io.dart';

class CreateCommand extends BaseCommand {
  CreateCommand() : super('create', 'Create a new brick');

  @override
  Future<void> run() async {
    logger.start(name, message: description);
    logger.verticalLine();
    final spinner = logger.progress('Creating a new brick...');
    final tpl = TemplateYaml.load();

    final creator = BrickCreatorGenerator.create(tpl);
    await creator.generate(
      DirectoryGeneratorTarget(Directory(join(Directory.current.path, tpl.target))),
      vars: tpl.vars,
    );

    creator.process();
    await Future.delayed(Duration(seconds: 3));
    spinner.success('Brick created');

    logger.verticalLine();
    final confirm = logger.confirm('Would you like to bundle this brick?', defaultValue: false);
    if (confirm) {
      logger.end('/$name/ complete');
      logger.newLine();
      logger.newLine();

      final bundle = BundleCommand(name: tpl.name, description: 'Make a bundle for publishing');
      await bundle.run();
    } else {
      logger.end('/$name/ complete');
    }
  }
}
