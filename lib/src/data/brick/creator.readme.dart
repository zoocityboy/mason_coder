part of 'creator.dart';

/// Generates a README.md file for the brick.
String _brickReadmeContent(String name, String description) => '''
# $name

[![Powered by Mason Bundler](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/zoocityboy/mason_bundler)

$description

''';
