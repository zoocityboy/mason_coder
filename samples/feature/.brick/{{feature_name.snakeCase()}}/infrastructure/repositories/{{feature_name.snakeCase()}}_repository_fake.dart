import 'dart:async';

import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';

{{#isDetail}} import '../../domain/entities/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_detail_entity.dart'; {{/isDetail}}
import '../../domain/entities/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_entity.dart';
import '../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
import '../models/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_detail_dto.dart';
import '../models/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_list_dto.dart';

class {{feature_name.pascalCase()}}RepositoryFake implements {{feature_name.pascalCase()}}Repository {
  {{#isList}}
  @override
  Future<Result<ApiFailure, {{feature_name.pascalCase()}}Entities>> getList({
    int page = 0,
    int limit = 20,
    CancelToken? token,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    final result = List.generate(limit, (index) => {{feature_name.pascalCase()}}Dto(id: index));
    final items = result.toEntities();
    return items.toSuccess();
  }

  {{/isList}}
  {{#isDetail}}
  @override
  Future<Result<ApiFailure, {{feature_name.pascalCase()}}DetailEntity>> getById(
    int id, {
    CancelToken? token,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    const item = {{feature_name.pascalCase()}}DetailDto(id: 1, name: 'Name');
    return item.toEntity().toSuccess();
  }
  {{/isDetail}}
}
