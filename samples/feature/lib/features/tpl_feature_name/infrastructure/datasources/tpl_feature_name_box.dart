import 'package:eit_storage/eit_storage.dart';

import '../models/tpl_feature_name/islist_tpl_feature_name_list_dto.dart';

class TplFeatureNameBox extends EitBox<TplFeatureNameDto> {
  TplFeatureNameBox() : super(boxKey: 'tpl_feature_name_box');
  static const String keyName = 'key';

  /// Save data to local storage with key [keyName]
  Future<void> save(TplFeatureNameDto value) => box.put(keyName, value);

  /// Get value by [keyName]
  TplFeatureNameDto? load() => box.get(keyName);

  /// Remove data by [keyName]
  Future<void> remove() async => box.delete(keyName);

  /// Clear all data
  Future<void> clear() async => box.clear();
}
