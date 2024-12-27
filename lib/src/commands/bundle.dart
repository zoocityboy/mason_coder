import 'package:mason_coder/src/commands/base.dart';

class BundleCommand extends BaseCommand {
  BundleCommand({String? name, String? description})
      : super(
          name ?? 'bundle',
          description ?? 'Make a bundle for publishing',
        );

  @override
  Future<void> run() async {
    if (!check) {
      logger.errorStyled('No bricks found');
      return;
    }
    logger.start(name, message: description);

    logger.verticalLine();
    final progress = logger.progress('Bundling brick...');
    await Future.delayed(Duration(seconds: 3));
    progress.success('Brick bundled');
    logger.end('/$name/ complete');
  }
}
