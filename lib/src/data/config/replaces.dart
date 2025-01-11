import 'package:json_annotation/json_annotation.dart';
import 'package:mason_coder/src/data/config/replace_variable_properties.dart';
import 'package:meta/meta.dart';

part 'replaces.g.dart';

@JsonSerializable()
class Replaces {
  Replaces({
    this.path = const [],
    this.content = const [],
  });
  @protected
  final List<ReplaceVariableProperties> path;
  List<ReplaceVariableProperties> get paths => path;

  @protected
  final List<ReplaceVariableProperties> content;
  List<ReplaceVariableProperties> get contents => content;

  factory Replaces.fromJson(Map<String, dynamic> json) => _$ReplacesFromJson(json);
  Map<String, dynamic> toJson() => _$ReplacesToJson(this);
}
