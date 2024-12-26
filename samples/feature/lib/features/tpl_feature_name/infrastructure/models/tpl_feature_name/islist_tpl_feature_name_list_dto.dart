import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/tpl_feature_name/tpl_feature_name_entity.dart';

part 'islist_tpl_feature_name_list_dto.g.dart';

typedef TplFeatureNameDtos = List<TplFeatureNameDto>;

@JsonSerializable(
  explicitToJson: true,
  anyMap: true,
  createToJson: true,
)
class TplFeatureNameDto {
  const TplFeatureNameDto({required this.id});
  @override
  factory TplFeatureNameDto.fromJson(Map<String, dynamic> json) => _$TplFeatureNameDtoFromJson(json);
  @JsonKey(defaultValue: -1)
  final int id;
  Map<String, dynamic> toJson() => _$TplFeatureNameDtoToJson(this);

  /// Convert [TplFeatureNameDto] DTO to domain [TplFeatureNameEntity] model
  TplFeatureNameEntity toEntity() {
    return TplFeatureNameEntity(id: id);
  }
}

extension TplFeatureNameDtoListX on List<TplFeatureNameDto> {
  TplFeatureNameEntities toEntities() => map((item) => item.toEntity()).toList();
}
