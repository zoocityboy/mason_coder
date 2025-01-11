// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replaces.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Replaces _$ReplacesFromJson(Map json) => $checkedCreate(
      'Replaces',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['path', 'content'],
        );
        final val = Replaces(
          path: $checkedConvert(
              'path',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => ReplaceVariableProperties.fromJson(
                          Map<String, dynamic>.from(e as Map)))
                      .toList() ??
                  const []),
          content: $checkedConvert(
              'content',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => ReplaceVariableProperties.fromJson(
                          Map<String, dynamic>.from(e as Map)))
                      .toList() ??
                  const []),
        );
        return val;
      },
    );

Map<String, dynamic> _$ReplacesToJson(Replaces instance) => <String, dynamic>{
      'path': instance.path.map((e) => e.toJson()).toList(),
      'content': instance.content.map((e) => e.toJson()).toList(),
    };
