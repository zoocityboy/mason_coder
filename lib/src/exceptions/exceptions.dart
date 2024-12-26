// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:mason_coder/src/constants.dart';
import 'package:mason_coder/src/l.dart';

/// Base Exception for Mason Brick Generator
class BundleTplException implements Exception {
  const BundleTplException(this.message);
  final String message;
}

/// Configuration file not found on project
class BundleTplConfigFileNotFound extends BundleTplException {
  const BundleTplConfigFileNotFound() : super('${Constants.bundleConfigFileName} ${L.notFound}');
}

/// Configuration file not found on project
class BundleTplConfigKeyNotFound extends BundleTplException {
  const BundleTplConfigKeyNotFound() : super('${Constants.bundlePubspeclKey} ${L.notFound}');
}

/// Template not found in configuration
class TemplateNotFound extends BundleTplException {
  const TemplateNotFound(String? message) : super(message ?? 'Template not found');
}

/// Invalid format of template
class InvalidTemplate extends BundleTplException {
  const InvalidTemplate(String? message) : super(message ?? 'Invalid template format');
}

/// Mason is not initialized
class MasonNotInstalled extends BundleTplException {
  const MasonNotInstalled(this.path) : super('Mason is not installed yet.');
  final String path;

  @override
  String toString() => '$message $path';
}

class MasonNotInitialized extends BundleTplException {
  const MasonNotInitialized(this.path) : super('Mason is not initialized yet.');
  final String path;

  @override
  String toString() => '$message $path';
}

/// Mason Brick Generator is not initialized
class MasonTplNotInitialized extends BundleTplException {
  const MasonTplNotInitialized(this.path) : super('Mason Tpl not initialized');
  final String path;

  @override
  String toString() => '$message $path';
}

/// Folder manipulation failed
class FolderProcessingFailed extends BundleTplException {
  FolderProcessingFailed(String message) : super('''Folder processing failed\n\nerror: $message''');
}
