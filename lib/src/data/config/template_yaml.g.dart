// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_yaml.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateYaml _$TemplateYamlFromJson(Map json) => $checkedCreate(
      'TemplateYaml',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'template',
            'description',
            'source',
            'target',
            'vars',
            'replaces',
            'clean',
            'ext',
            'version'
          ],
        );
        final val = TemplateYaml(
          name: $checkedConvert('template', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          replaces: $checkedConvert('replaces',
              (v) => Replaces.fromJson(Map<String, dynamic>.from(v as Map))),
          source: $checkedConvert(
              'source',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  ['lib']),
          target: $checkedConvert('target', (v) => v as String? ?? '.brick'),
          vars: $checkedConvert(
              'vars',
              (v) => v == null
                  ? const <String, BrickVariableProperties>{}
                  : const VarsConverter().fromJson(v)),
          clean: $checkedConvert('clean',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          ext: $checkedConvert('ext',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          version: $checkedConvert('version', (v) => v as String? ?? '0.1.0'),
        );
        return val;
      },
      fieldKeyMap: const {'name': 'template'},
    );

Map<String, dynamic> _$TemplateYamlToJson(TemplateYaml instance) =>
    <String, dynamic>{
      'template': instance.name,
      'description': instance.description,
      'source': instance.source,
      'target': instance.target,
      if (const VarsConverter().toJson(instance.vars) case final value?)
        'vars': value,
      'replaces': instance.replaces.toJson(),
      if (instance.clean case final value?) 'clean': value,
      if (instance.ext case final value?) 'ext': value,
      'version': instance.version,
    };
