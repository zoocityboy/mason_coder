import 'package:eit_core/eit_core.dart';
import 'package:eit_storage/eit_storage.dart';

import '../../infrastructure/models/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_list_dto.dart';

/// Stores and retrieves [{{feature_name.pascalCase()}}Dto] in/from local storage.
///
/// The implementation uses [EitStorage] database.
abstract class {{feature_name.pascalCase()}}LocalDataSource implements LocalDataSource {
  /// Get list of all stored [{{feature_name.pascalCase()}}Dto]
  Future<List<{{feature_name.pascalCase()}}Dto>> getAll();

  /// Find [{{feature_name.pascalCase()}}Dto] item by id
  Future<{{feature_name.pascalCase()}}Dto?> findById(String id);

  /// Save [{{feature_name.pascalCase()}}Dto] to local storage
  Future<{{feature_name.pascalCase()}}Dto> save({{feature_name.pascalCase()}}Dto item);

  /// Delete concrete [{{feature_name.pascalCase()}}Dto]
  Future<void> delete({{feature_name.pascalCase()}}Dto item);

  /// Delete all stored items
  Future<void> deleteAll();

  /// Returns a stream of list of [{{feature_name.pascalCase()}}Dto] stored in local storage.
  ///
  /// A new event will be emitted whenever an [{{feature_name.pascalCase()}}Dto] is updated, removed,
  /// or a new [{{feature_name.pascalCase()}}Dto] is stored.
  Stream<List<{{feature_name.pascalCase()}}Dto>> watchAllItems();
}
