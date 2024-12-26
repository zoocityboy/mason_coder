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
            'files',
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
          source: $checkedConvert('source', (v) => v as String? ?? '/'),
          target: $checkedConvert('target', (v) => v as String? ?? '.bundle'),
          files: $checkedConvert(
              'files',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const []),
          vars: $checkedConvert(
              'vars',
              (v) => v == null
                  ? const <String, BrickVariableProperties>{}
                  : const VarsConverter().fromJson(v)),
          clean: $checkedConvert(
              'clean',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const []),
          ext: $checkedConvert(
              'ext',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const []),
          version: $checkedConvert('version', (v) => v as String? ?? '0.0.0'),
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
      'files': instance.files,
      if (const VarsConverter().toJson(instance.vars) case final value?)
        'vars': value,
      'replaces': instance.replaces.toJson(),
      'clean': instance.clean,
      'ext': instance.ext,
      'version': instance.version,
    };
