import 'package:equatable/equatable.dart';

typedef TplFeatureNameEntities = List<TplFeatureNameEntity>;

class TplFeatureNameEntity extends Equatable {
  const TplFeatureNameEntity({
    required this.id,
  });
  final int id;
  @override
  List<Object?> get props => [id];

  TplFeatureNameEntity copyWith({
    int? id,
  }) {
    return TplFeatureNameEntity(
      id: id ?? this.id,
    );
  }
}
