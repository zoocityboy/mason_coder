import 'package:mason/mason.dart';

void run(HookContext context) {
  String stripHtmlIfNeeded(String text) {
    return text.replaceAll(RegExp('<[^>]*>|&[^;]+;'), ' ');
  }

  context.vars = {
    ...context.vars,
    'custom_var': 'foo',
  };
}
