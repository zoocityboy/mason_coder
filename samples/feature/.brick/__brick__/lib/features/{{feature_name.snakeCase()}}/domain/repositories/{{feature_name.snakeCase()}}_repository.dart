import 'package:eit_core/eit_core.dart';
import 'package:eit_networking/eit_networking.dart';

{{#isDetail}} import '../entities/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_detail_entity.dart'; {{/isDetail}}
import '../entities/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_entity.dart';

abstract class {{feature_name.pascalCase()}}Repository implements Repository {
  {{#isList}}
  Future<Result<ApiFailure, {{feature_name.pascalCase()}}Entities>> getList({
    int page = 0,
    int limit = 20,
    CancelToken? token,
  });
  {{/isList}}

  {{#isDetail}}
  Future<Result<ApiFailure, {{feature_name.pascalCase()}}DetailEntity>> getById(
    int id, {
    CancelToken? token,
  });
  {{/isDetail}}
}
