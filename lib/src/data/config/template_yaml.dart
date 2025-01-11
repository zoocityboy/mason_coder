// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:checked_yaml/checked_yaml.dart';
import 'package:json_annotation/json_annotation.dart';
// ignore: implementation_imports
import 'package:mason/src/brick_yaml.dart' show VarsConverter, BrickVariableProperties;
import 'package:mason_coder/mason_coder.dart';
import 'package:mason_coder/src/data/config/replaces.dart';
import 'package:path/path.dart' as p;
import 'package:universal_io/io.dart';
import 'package:yaml/yaml.dart';

part 'template_yaml.g.dart';

////
@JsonSerializable()
class TemplateYaml {
  ////
  TemplateYaml({
    required this.name,
    required this.description,
    required this.replaces,
    this.source = const ['lib'],
    this.target = Constants.brickFolder,
    this.vars = const <String, BrickVariableProperties>{},
    this.clean,
    this.ext,
    this.version = '0.1.0',
  });
  factory TemplateYaml.load() {
    try {
      return fromPubspec();
    } on BundleTplConfigKeyNotFound {
      return fromFile();
    }
  }

  static TemplateYaml fromPubspec() {
    final configFile = File(p.join(Directory.current.path, Constants.pubspeckFileName));
    if (!configFile.existsSync()) throw MasonCoderConfigFileNotFound();

    /// Check if pubspec.yaml exists
    final content = loadYaml(configFile.readAsStringSync());

    /// Check if mason_coder key exists
    if (content[Constants.bundlePubspeclKey] == null) throw const BundleTplConfigKeyNotFound();

    return TemplateYaml.fromJson(Map<String, dynamic>.from(content[Constants.bundlePubspeclKey] as Map));
  }

  static TemplateYaml fromFile() {
    final configFile = File(p.join(Directory.current.path, Constants.bundleConfigFileName));
    if (!configFile.existsSync()) throw MasonCoderConfigFileNotFound();

    final configYaml = checkedYamlDecode(
      configFile.readAsStringSync(),
      (m) {
        return TemplateYaml.fromJson(m!);
      },
    );

    return configYaml;
  }

  /// Converts [Map] to [TemplateYaml]
  factory TemplateYaml.fromJson(Map<dynamic, dynamic> json) => _$TemplateYamlFromJson(json);

  /// Converts [TemplateYaml] to [Map]
  Map<String, dynamic> toJson() => _$TemplateYamlToJson(this);

  /// Name of the brick.
  @JsonKey(name: 'template')
  final String name;

  /// Description of the brick.
  final String description;

  /// Version of the brick (semver).
  @JsonKey(defaultValue: ['lib'])
  final List<String> source;

  @JsonKey(defaultValue: Constants.brickFolder)
  final String target;

  /// Map of variable properties used when templating a brick.
  @VarsConverter()
  final Map<String, BrickVariableProperties> vars;

  final Replaces replaces;

  final List<String>? clean;

  final List<String>? ext;

  final String version;

  @override
  String toString() {
    return '$name - $description';
  }

  /// Used by AnyChoice for choose value
  String get asChoice => '[$name]: $description';

  /// Path definition of __brick__ root like
  /// "root/bricks/my-brick/__brick__/"
  String get brickDestinationPath => p.join(
        target,
        name,
        Constants.brickTeplateFolder,
      );

  /// Path definition of template root
  /// "root/bricks/my-brick/"
  String get brickRootPath => target;

  String get bundleRootPath => Constants.bundleFolder;

  String get bundleName => '$name.bundle';

  Map<String, dynamic> varsToJson() {
    final json = <String, dynamic>{};
    vars.forEach((key, value) {
      json[key] = value.toJson();
    });
    return json;
  }
}
