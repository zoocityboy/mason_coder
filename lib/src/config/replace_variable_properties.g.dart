// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replace_variable_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplaceVariableProperties _$ReplaceVariablePropertiesFromJson(Map json) =>
    $checkedCreate(
      'ReplaceVariableProperties',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['key', 'type', 'value', 'prefix', 'suffix'],
        );
        final val = ReplaceVariableProperties(
          type: $checkedConvert(
              'type',
              (v) =>
                  $enumDecodeNullable(_$ReplaceVariableTypeEnumMap, v) ??
                  ReplaceVariableType.content),
          key: $checkedConvert('key', (v) => v as String),
          value: $checkedConvert('value', (v) => v as String? ?? ''),
          prefix: $checkedConvert('prefix', (v) => v as String?),
          suffix: $checkedConvert('suffix', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$ReplaceVariablePropertiesToJson(
        ReplaceVariableProperties instance) =>
    <String, dynamic>{
      'key': instance.key,
      'type': _$ReplaceVariableTypeEnumMap[instance.type]!,
      'value': instance.value,
      if (instance.prefix case final value?) 'prefix': value,
      if (instance.suffix case final value?) 'suffix': value,
    };

const _$ReplaceVariableTypeEnumMap = {
  ReplaceVariableType.import: 'import',
  ReplaceVariableType.content: 'content',
  ReplaceVariableType.path: 'path',
};
