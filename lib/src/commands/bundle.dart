import 'package:mason_coder/mason_coder.dart';
import 'package:mason_coder/src/commands/base.dart';
import 'package:mason_coder/src/publisher/publisher.dart';

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
    final tpl = TemplateYaml.load();
    final progress = logger.progress('Bundling brick...');
    final publisher = Publisher(logger, tpl, '');
    await publisher.generate();
    await Future.delayed(Duration(seconds: 2));
    progress.success('Brick bundled');
    logger.end('/$name/ complete');
  }
}
