import 'package:args/command_runner.dart';
import 'package:mason_coder/mason_coder.dart';
import 'package:mason_coder/src/commands/bundle.dart';
import 'package:mason_coder/src/commands/create.dart';
import 'package:mason_coder/src/commands/validate.dart';
import 'package:universal_io/io.dart';

final logger = Console();
Future<void> main(List<String> args) async {
  try {
    final runner = CommandRunner('mason_coder', 'Mason Coder CLI')
      ..addCommand(CreateCommand())
      ..addCommand(BundleCommand())
      ..addCommand(ValidateCommand());
    await runner.run(args);
  } on MasonCoderException catch (e) {
    // logger.errorStyled(e.toString());
    logger.errorStyled(e.toString());

    exit(64);
  } on UsageException catch (e) {
    logger.errorStyled(e.message.bold());
    logger.detailStyled(e.usage);
    exit(64);
  } catch (e) {
    logger.errorStyled(e.toString());
    exit(64);
  }
}

// Future<void> run(ArgResults results) async {
//   switch (results.option('action')) {
//     case 'init':
//       final tpl = TemplateYaml.load();
//       final creator = BrickCreatorGenerator.create(tpl);
//       await creator.generate(
//         DirectoryGeneratorTarget(Directory(join(Directory.current.path, tpl.target))),
//         vars: tpl.vars,
//       );
//       creator.process();
//       // final generator = GenericBrickGenerator(
//       //   creator.tpl.name,
//       //   creator.tpl.description,
//       //   createHooks: true,
//       //   vars: creator.tpl.vars.keys.toList(),
//       // );
//       // final tempFolder = Directory(join(Directory.systemTemp.path, creator.tpl.hashCode.toString()));
//       // final result = await generator.generate(
//       //   DirectoryGeneratorTarget(
//       //     tempFolder,
//       //   ),
//       //   vars: creator.tpl.vars,
//       // );
//       // await Shell.cp(join(tempFolder.path, creator.tpl.name),
//       //     Directory(join(Directory.current.path, Constants.bricksFolder)).path);
//       // await Shell.rm(tempFolder.path);
//       // stdout.writeln(result);
//       // final value = BrickCreator.init();
//       // await value.generate();

//       // ///
//       // final publisher = Publisher(BrickCreator.console, value.tpl, '');
//       // await publisher.create();

//       ///
//       // await value.clean();
//       break;
//     case 'pack':
//       print('Packing bundle...');
//       break;
//       defalut:
//       print('Invalid action');
//   }
// }
