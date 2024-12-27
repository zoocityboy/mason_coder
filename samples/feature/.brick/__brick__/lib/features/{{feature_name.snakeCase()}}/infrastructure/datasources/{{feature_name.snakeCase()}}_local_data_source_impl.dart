import 'package:eit_core/eit_core.dart';

import '../../domain/datasources/{{feature_name.snakeCase()}}_local_datasource.dart';
import '../models/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_list_dto.dart';
import '{{feature_name.snakeCase()}}_box.dart';

// TODO(platform): [{{feature_name.pascalCase()}}ImplLocalDataSource] implement all functions and remove this line!!
class {{feature_name.pascalCase()}}LocalDataSourceImpl extends DataSourceRequest implements {{feature_name.pascalCase()}}LocalDataSource {
  {{feature_name.pascalCase()}}LocalDataSourceImpl({
    required this.box,
  });
  final {{feature_name.pascalCase()}}Box box;

  @override
  Future<void> delete({{feature_name.pascalCase()}}Dto item) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() {
    // TODO(platform): implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<{{feature_name.pascalCase()}}Dto?> findById(String id) {
    // TODO(platform): implement findById
    throw UnimplementedError();
  }

  @override
  Future<List<{{feature_name.pascalCase()}}Dto>> getAll() {
    // TODO(platform): implement getAll
    throw UnimplementedError();
  }

  @override
  Future<{{feature_name.pascalCase()}}Dto> save({{feature_name.pascalCase()}}Dto item) {
    // TODO(platform): implement save
    throw UnimplementedError();
  }

  @override
  Stream<List<{{feature_name.pascalCase()}}Dto>> watchAllItems() {
    // TODO(platform): implement watchAllAlbums
    throw UnimplementedError();
  }

  @override
  Future<void> clear() => tryRequest(() async {
        await box.clear();
      });
}
