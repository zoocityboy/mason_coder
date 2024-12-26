import 'package:json_annotation/json_annotation.dart';
import 'package:mason_coder/src/config/replace_variable_properties.dart';
import 'package:meta/meta.dart';

part 'replaces.g.dart';

@JsonSerializable()
class Replaces {
  Replaces({
    this.import = const [],
    this.path = const [],
    this.content = const [],
  });
  @protected
  final List<ReplaceVariableProperties> import;
  List<ReplaceVariableProperties> get imports =>
      import.map((e) => e.copyWith(type: ReplaceVariableType.import)).toList();
  @protected
  final List<ReplaceVariableProperties> path;
  List<ReplaceVariableProperties> get paths => path.map((e) => e.copyWith(type: ReplaceVariableType.path)).toList();

  @protected
  final List<ReplaceVariableProperties> content;
  List<ReplaceVariableProperties> get contents =>
      content.map((e) => e.copyWith(type: ReplaceVariableType.content)).toList();

  factory Replaces.fromJson(Map<String, dynamic> json) => _$ReplacesFromJson(json);
  Map<String, dynamic> toJson() => _$ReplacesToJson(this);
}
