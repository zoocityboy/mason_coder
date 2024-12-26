import 'package:eit_storage/eit_storage.dart';

import '../models/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_list_dto.dart';

class {{feature_name.pascalCase()}}Box extends EitBox<{{feature_name.pascalCase()}}Dto> {
  {{feature_name.pascalCase()}}Box() : super(boxKey: '{{feature_name.snakeCase()}}_box');
  static const String keyName = 'key';

  /// Save data to local storage with key [keyName]
  Future<void> save({{feature_name.pascalCase()}}Dto value) => box.put(keyName, value);

  /// Get value by [keyName]
  {{feature_name.pascalCase()}}Dto? load() => box.get(keyName);

  /// Remove data by [keyName]
  Future<void> remove() async => box.delete(keyName);

  /// Clear all data
  Future<void> clear() async => box.clear();
}
