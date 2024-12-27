// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:mason_coder/mason_coder.dart';
import 'package:mason_coder/src/commands/create.dart';
import 'package:mason_coder/src/utils/l.dart';

/// Base Exception for Mason Brick Generator
class MasonCoderException implements Exception {
  const MasonCoderException(this.message, {this.suggestions = const <String>[]});
  final String message;
  final List<String> suggestions;
}

/// Configuration file not found on project
class MasonCoderConfigFileNotFound extends MasonCoderException {
  MasonCoderConfigFileNotFound()
      : super('Configuration file ${Constants.bundleConfigFileName.bold()} ${L.notFound}', suggestions: [
          'Create ${Constants.bundleConfigFileName.cyan()} in the root of your project',
          'Run ${Constants.runner.cyan()} ${CreateCommand().name.cyan()} to create a new brick',
        ]);

  @override
  String toString() {
    return '''
$message
${suggestions.map((s) => s.white()).join('\n')}'''
        .trim();
  }
}

/// Configuration file not found on project
class BundleTplConfigKeyNotFound extends MasonCoderException {
  const BundleTplConfigKeyNotFound() : super('${Constants.bundlePubspeclKey} ${L.notFound}');
}

/// Template not found in configuration
class TemplateNotFound extends MasonCoderException {
  const TemplateNotFound(String? message) : super(message ?? 'Template not found');
}
