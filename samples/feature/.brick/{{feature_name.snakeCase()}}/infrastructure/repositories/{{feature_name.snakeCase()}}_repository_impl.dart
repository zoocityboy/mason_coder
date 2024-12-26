import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';

{{#isDetail}} import '../../domain/entities/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_detail_entity.dart'; {{/isDetail}}
import '../../domain/entities/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_entity.dart';
import '../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';

class {{feature_name.pascalCase()}}RepositoryImpl implements {{feature_name.pascalCase()}}Repository {
  {{#isList}}
  @override
  Future<Result<ApiFailure, {{feature_name.pascalCase()}}Entities>> getList({
    int page = 0,
    int limit = 20,
    CancelToken? token,
  }) {
    throw UnimplementedError();
  }
  {{/isList}}

  {{#isDetail}}
  @override
  Future<Result<ApiFailure, {{feature_name.pascalCase()}}DetailEntity>> getById(
    int id, {
    CancelToken? token,
  }) {
    throw UnimplementedError();
  }
  {{/isDetail}}
}
