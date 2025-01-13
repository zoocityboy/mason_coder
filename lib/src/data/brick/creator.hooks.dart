part of 'creator.dart';

String _hooksPubspecContent(String name, String packageVersion, {String masonVersion = '^0.1.0'}) => '''
name: ${name}_hooks
version: $packageVersion
environment:
  sdk: ^3.5.0

dependencies:
  mason: ^$masonVersion
''';

const _hooksGitignoreContent = '''
.dart_tool
.packages
pubspec.lock
build
''';

const _hooksPreGenContent = '''
import 'package:mason/mason.dart';

void run(HookContext context) {
  // TODO: add pre-generation logic.
}
''';
const _hooksPostGenContent = '''
import 'package:mason/mason.dart';

void run(HookContext context) {
  // TODO: add post-generation logic.
}
''';
