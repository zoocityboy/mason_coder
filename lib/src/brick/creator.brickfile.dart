part of 'creator.dart';

String brickYamlContent({
  String brickVersion = '0.1.0',
  required String name,
  required String description,
  String masonVersion = '0.1.0',
  Map<String, BrickVariableProperties> vars = const {},
}) {
  final mapped = VarsConverter().toJson(vars);
  stdout.writeln('vars: $vars');
  stdout.writeln('mapped: $mapped');
  return '''
name: $name
description: $description
version: 0.1.0
environment:
  mason: $masonVersion
${json2yaml({'vars': VarsConverter().toJson(vars)})}
''';
}