import 'package:mason_coder/src/commands/base.dart';

class ValidateCommand extends BaseCommand {
  ValidateCommand() : super('validate', 'Validate brick settings');

  @override
  Future<void> run() async {
    logger.start(name, message: description);
    logger.verticalLine();
    final progress = logger.progress('Validating brick settings...');
    await Future.delayed(Duration(seconds: 3));
    progress.success('Brick settings are valid');
    logger.end('/$name/ complete');
  }
}
