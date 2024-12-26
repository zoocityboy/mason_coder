import 'package:equatable/equatable.dart';

typedef {{feature_name.pascalCase()}}Entities = List<{{feature_name.pascalCase()}}Entity>;

class {{feature_name.pascalCase()}}Entity extends Equatable {
  const {{feature_name.pascalCase()}}Entity({
    required this.id,
  });
  final int id;
  @override
  List<Object?> get props => [id];

  {{feature_name.pascalCase()}}Entity copyWith({
    int? id,
  }) {
    return {{feature_name.pascalCase()}}Entity(
      id: id ?? this.id,
    );
  }
}
