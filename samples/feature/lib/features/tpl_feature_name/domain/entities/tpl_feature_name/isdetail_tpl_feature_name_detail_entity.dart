import 'tpl_feature_name_entity.dart';

typedef TplFeatureNameDetailEntities = List<TplFeatureNameDetailEntity>;

class TplFeatureNameDetailEntity extends TplFeatureNameEntity {
  const TplFeatureNameDetailEntity({
    required super.id,
    required this.name,
  });
  final String name;
  @override
  List<Object?> get props => [id, name];

  @override
  TplFeatureNameDetailEntity copyWith({
    int? id,
    String? name,
  }) {
    return TplFeatureNameDetailEntity(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
