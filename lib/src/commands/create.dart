import 'package:mason/mason.dart';
import 'package:mason_coder/mason_coder.dart';
import 'package:mason_coder/src/commands/base.dart';
import 'package:mason_coder/src/commands/bundle.dart';
import 'package:mason_coder/src/data/brick/creator.dart';
import 'package:path/path.dart';
import 'package:promptly/promptly.dart';
import 'package:pub_updater/pub_updater.dart';
import 'package:universal_io/io.dart';

class CreateCommand extends BaseCommand {
  CreateCommand()
      : super(
          'create',
          'Create a new brick',
          category: 'Manage',
        );

  @override
  Future<int> run() async {
    header(name, message: description);

    final spinner = processing('Creating a new brick...');
    final masonVersion = await PubUpdater().getLatestVersion('mason');
    final tpl = TemplateYaml.load();

    final creator = BrickCreatorGenerator.create(tpl, masonVersion);
    await creator.generate(
      DirectoryGeneratorTarget(Directory(join(Directory.current.path, tpl.target))),
      vars: tpl.vars,
    );

    creator.process();
    await Future.delayed(Duration(seconds: 3));
    spinner.success('Brick created');

    line();
    final c = confirm('Would you like to bundle this brick?', defaultValue: false);
    if (c) {
      section('/$name/', message: 'complete');
      line();
      line();

      final bundle = BundleCommand(name: tpl.name, description: 'Make a bundle for publishing');
      return await bundle.run();
      // final progress = processing('Bundling brick...');
      // final publisher = Publisher(console, tpl, '');
      // await publisher.create();
      // progress.success('Brick bundled');
      // return finishSuccesfuly('/$name/', message: 'complete');
    } else {
      return finishSuccesfuly('/$name/', message: 'complete');
    }
  }
}
