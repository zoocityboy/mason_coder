import 'package:args/args.dart';
import 'package:mason/mason.dart';
import 'package:mason_coder/mason_coder.dart';
import 'package:mason_coder/src/brick/creator.dart';
import 'package:path/path.dart';
import 'package:universal_io/io.dart';

Future<void> main(List<String> args) async {
  var parser = ArgParser();
  parser.addOption('action', allowed: ['create', 'pack'], defaultsTo: 'create');
  final results = parser.parse(args);
  try {
    await run(results);
    exit(0);
  } catch (e) {
    print(e);
    exit(64);
  }
}

Future<void> run(ArgResults results) async {
  switch (results.option('action')) {
    case 'create':
      final tpl = TemplateYaml.load();
      final creator = BrickCreatorGenerator.create(tpl);
      await creator.generate(
        DirectoryGeneratorTarget(Directory(join(Directory.current.path, Constants.bricksFolder))),
        vars: tpl.vars,
      );
      creator.process();
      // final generator = GenericBrickGenerator(
      //   creator.tpl.name,
      //   creator.tpl.description,
      //   createHooks: true,
      //   vars: creator.tpl.vars.keys.toList(),
      // );
      // final tempFolder = Directory(join(Directory.systemTemp.path, creator.tpl.hashCode.toString()));
      // final result = await generator.generate(
      //   DirectoryGeneratorTarget(
      //     tempFolder,
      //   ),
      //   vars: creator.tpl.vars,
      // );
      // await Shell.cp(join(tempFolder.path, creator.tpl.name),
      //     Directory(join(Directory.current.path, Constants.bricksFolder)).path);
      // await Shell.rm(tempFolder.path);
      // stdout.writeln(result);
      // final value = BrickCreator.init();
      // await value.generate();

      // ///
      // final publisher = Publisher(BrickCreator.console, value.tpl, '');
      // await publisher.create();

      ///
      // await value.clean();
      break;
    case 'pack':
      print('Packing bundle...');
      break;
      defalut:
      print('Invalid action');
  }
}
