import 'package:json2yaml/json2yaml.dart';
import 'package:mason/mason.dart' hide StringCaseExtensions;
import 'package:mason_coder/mason_coder.dart';
import 'package:mason_coder/src/commands/base.dart';
import 'package:mason_coder/src/commands/create.dart';
import 'package:mason_coder/src/data/config/replace_variable_properties.dart';
import 'package:mason_coder/src/data/config/replaces.dart';
import 'package:path/path.dart';
import 'package:promptly/promptly.dart';
import 'package:universal_io/io.dart';

class InitCommand extends BaseCommand {
  InitCommand() : super('init', 'Initialize configuration');
  bool get configExistts => File(join(Directory.current.path, Constants.bundleConfigFileName)).existsSync();
  bool get featuresExists => Directory(join(Directory.current.path, 'lib', 'features')).existsSync();
  Directory? get firstFeature {
    final features = Directory(join(Directory.current.path, 'lib', 'features')).listSync();
    if (features.isNotEmpty) {
      return features.first as Directory;
    }
    return null;
  }

  String get featureName => basename(
        firstFeature?.path ?? 'xxx',
      );

  @override
  Future<int> run() async {
    header(name, message: description);
    shouldOverrider();
    createConfiguration();
    return await createBrick();
  }

  int? shouldOverrider() {
    if (configExistts) {
      final shouldOverride =
          confirm('Configuration already exists. Would you like to override it?', defaultValue: false);
      if (!shouldOverride) {
        return finishSuccesfuly('/$name/', message: 'complete');
      }
      line();
    }
  }

  int createConfiguration() {
    final dirName = basename(Directory.current.path);
    final brickName = prompt('Name of brick', defaultValue: dirName);
    line();
    final brickDescription = prompt('Description of brick', defaultValue: 'A new $brickName brick');
    line();

    final tpl = TemplateYaml(
      name: brickName,
      description: brickDescription,
      source: ['lib', 'test'],
      vars: {
        if (featuresExists)
          'feature_name': BrickVariableProperties.string(
            prompt: 'What`s a feature name',
            defaultValue: featureName,
          ),
        'name': BrickVariableProperties.string(prompt: 'What`s a name'),
      },
      replaces: Replaces(
        path: [
          if (featuresExists)
            ReplaceVariableProperties(
              key: featureName,
              value: '{{feature_name.snakeCase()}}',
            ),
          ReplaceVariableProperties(
            key: brickName,
            value: '{{name.snakeCase()}}',
          ),
        ],
        content: [
          if (featuresExists)
            ReplaceVariableProperties(
              key: featureName.snakeCase,
              value: '{{feature_name.snakeCase()}}',
            ),
          ReplaceVariableProperties(
            key: brickName.pascalCase,
            value: '{{name.pascalCase()}}',
          ),
          ReplaceVariableProperties(
            key: brickName.snakeCase,
            value: '{{name.snakeCase()}}',
          ),
        ],
      ),
      version: Version(0, 1, 0).toString(),
    );
    File(join(Directory.current.path, Constants.bundleConfigFileName)).writeAsStringSync(json2yaml(tpl.toJson()));
    return finishSuccesfuly('/$name/', message: 'complete');
  }

  Future<int> createBrick() async {
    final confirm = console.confirm('Would you like to create the brick now?', defaultValue: true);
    if (confirm) {
      console.cleanScreen();
      final createCommand = CreateCommand();
      return await createCommand.run();
    } else {
      line();
      info('Run `mason_coder create` to create your brick');
      return ExitCode.software.code;
    }
  }
}
