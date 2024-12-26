// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_dynamic_calls
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'replace_variable_properties.g.dart';

enum ReplaceVariableType {
  /// Import
  import,

  /// Content
  content,

  /// Path
  path,
}

/// This class represents a Path Definition.
@JsonSerializable()
class ReplaceVariableProperties {
  /// This class represents a Path Definition.
  @internal
  const ReplaceVariableProperties({
    this.type = ReplaceVariableType.content,
    required this.key,
    this.value = '',
    this.prefix,
    this.suffix,
  });

  /// {@macro brick_variable_properties}
  ///
  /// Creates an instance of a [ReplaceVariableProperties]
  /// of type [ReplaceVariableProperties.content].
  const ReplaceVariableProperties.content()
      : this(
          type: ReplaceVariableType.content,
          key: 'string',
          value: '',
        );

  /// A factory method to create an instance of PathDefinition from a JSON map.
  factory ReplaceVariableProperties.fromJson(Map<String, dynamic> json) {
    return _$ReplaceVariablePropertiesFromJson(json);
  }

  /// A method to convert PathDefinition instance to a JSON map.
  Map<String, dynamic> toJson() => _$ReplaceVariablePropertiesToJson(this);

  /// The key of the path definition.
  final String key;

  @JsonKey(defaultValue: ReplaceVariableType.content)
  final ReplaceVariableType type;

  /// The value of the path definition. It has a default value of an empty string.
  @JsonKey(defaultValue: '')
  final String value;

  /// The prefix of the line.
  /// ```dart
  /// prefix = '{{#detail}}';
  /// suffix = '{{/detail}}';
  /// {{#detail}}import '../detail.dart';{{/detail}}
  /// ```
  final String? prefix;

  /// The suffix of the line.
  /// ```dart
  /// prefix = '{{#detail}}';
  /// suffix = '{{/detail}}';
  /// {{#detail}}import '../detail.dart';{{/detail}}
  /// ```
  final String? suffix;

  @override
  String toString() {
    return 'ReplaceVariableProperties(key: $key, value: $value, prefix: $prefix, suffix: $suffix)';
  }

  ReplaceVariableProperties copyWith({
    String? key,
    ReplaceVariableType? type,
    String? value,
    String? prefix,
    String? suffix,
  }) {
    return ReplaceVariableProperties(
      key: key ?? this.key,
      type: type ?? this.type,
      value: value ?? this.value,
      prefix: prefix ?? this.prefix,
      suffix: suffix ?? this.suffix,
    );
  }
}

extension ReplaceVariablePropertiesExtension on List<ReplaceVariableProperties> {
  Map<String, bool> toSearchMapWithDefault({bool value = false}) {
    final found = <String, bool>{};
    for (final x in this) {
      found[x.key] = false;
    }
    return found;
  }
}

/// {@template vars_converter}
/// Json Converter for [Map<String, PathProperties>].
/// {@endtemplate}
class PathConverter implements JsonConverter<Map<String, ReplaceVariableProperties>, dynamic> {
  /// {@macro vars_converter}
  const PathConverter();

  @override
  dynamic toJson(Map<String, ReplaceVariableProperties> value) {
    return value.map((key, value) => MapEntry(key, value.toJson()));
  }

  @override
  Map<String, ReplaceVariableProperties> fromJson(dynamic value) {
    final dynamic value0 = value is String ? json.decode(value) : value;
    if (value0 is List) {
      return <String, ReplaceVariableProperties>{
        for (final v in value0)
          v['name'] as String: ReplaceVariableProperties.fromJson(Map<String, dynamic>.from(v as Map)),
      };
    }
    if (value0 is Map) {
      return value0.map(
        (dynamic key, dynamic value) {
          final entry = MapEntry(
            key as String,
            ReplaceVariableProperties.fromJson({
              'key': key,
              'type': value?['type'] ?? '',
              'value': value?['value'] ?? '',
              'prefix': value?['prefix'],
              'suffix': value?['suffix'],
            }),
          );
          return entry;
        },
      );
    }
    throw const FormatException();
  }
}
