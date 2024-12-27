import 'package:mason/mason.dart';
import 'package:meta/meta.dart';

/// Constants for Mason Brick Generator
@protected
abstract class Constants {
  static const String runner = 'mason_coder';

  /// Mandatory file names
  static const String bundleConfigFileName = 'mason_template.yaml';
  static const String pubspeckFileName = 'pubspec.yaml';
  static const String bundlePubspeclKey = 'mason_template';

  /// Folder structure
  static const String bricksFolder = '.brick';
  static const String hooksFolder = '.hooks';

  /// File structure
  static const String brickFolder = '__brick__';

  /// RegExp
  static RegExp importLineContent = RegExp(r"\'(.*?)\'");

  /// Mason Brick Generator
  static const String brickVersion = '"0.1.0+dev.0"';
  static const String brickMasonRange = '">=0.1.0-dev.60 <0.1.0"';
}

extension MasonVarsMapper on Map<String, BrickVariableProperties> {
  Map<String, dynamic> toJson() => map((key, value) => MapEntry(key, value.toJson()));
}
