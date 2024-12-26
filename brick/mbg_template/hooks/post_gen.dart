import 'package:mason/mason.dart';

void run(HookContext context) {
  context.logger.info('hello {{name}}!');
  context.logger.info('vars: {{vars}}');
}
