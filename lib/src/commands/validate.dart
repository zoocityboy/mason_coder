import 'package:mason_coder/src/commands/base.dart';
import 'package:promptly/promptly.dart';

class ValidateCommand extends BaseCommand {
  ValidateCommand() : super('validate', 'Validate brick settings', aliases: ['v'], category: 'Start');

  @override
  Future<int> run() async {
    header(name, message: description);
    line();
    final progress = processing('Validating brick settings...');
    await Future.delayed(Duration(seconds: 3));
    progress.success('Brick settings are valid');

    return finishSuccesfuly('/$name/ complete');
  }
}
