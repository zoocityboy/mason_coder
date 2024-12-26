// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isdetail_tpl_feature_name_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplFeatureNameDetailDto _$TplFeatureNameDetailDtoFromJson(
        Map<String, dynamic> json) =>
    TplFeatureNameDetailDto(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['name'] as String,
    );

Map<String, dynamic> _$TplFeatureNameDetailDtoToJson(
        TplFeatureNameDetailDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
