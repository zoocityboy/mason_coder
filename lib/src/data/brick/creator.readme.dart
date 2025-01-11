part of 'creator.dart';

/// Generates a README.md file for the brick.
String _brickReadmeContent(String name, String description) => '''
# $name

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason)](https://github.com/zoocityboy/mason_coder)

[![Created by Mason Coder](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-coder)](https://github.com/zoocityboy/mason_coder)

$description

''';
