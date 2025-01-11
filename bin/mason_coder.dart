import 'package:mason_coder/src/commands/bundle.dart';
import 'package:mason_coder/src/commands/create.dart';
import 'package:mason_coder/src/commands/init.dart';
import 'package:mason_coder/src/commands/validate.dart';
import 'package:promptly/promptly.dart';

Future<void> main(List<String> args) => MyRunner().safeRun(args);

class MyRunner extends CommandRunner {
  MyRunner() : super('mason_coder', 'Mason Coder CLI', version: '0.1.0+alpha.0') {
    addCommand(InitCommand());
    addCommand(CreateCommand());
    addCommand(BundleCommand());
    addCommand(ValidateCommand());
  }
}
