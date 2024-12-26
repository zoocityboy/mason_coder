import 'package:eit_core/eit_core.dart';
import 'package:eit_storage/eit_storage.dart';

import '../../infrastructure/models/tpl_feature_name/islist_tpl_feature_name_list_dto.dart';

/// Stores and retrieves [TplFeatureNameDto] in/from local storage.
///
/// The implementation uses [EitStorage] database.
abstract class TplFeatureNameLocalDataSource implements LocalDataSource {
  /// Get list of all stored [TplFeatureNameDto]
  Future<List<TplFeatureNameDto>> getAll();

  /// Find [TplFeatureNameDto] item by id
  Future<TplFeatureNameDto?> findById(String id);

  /// Save [TplFeatureNameDto] to local storage
  Future<TplFeatureNameDto> save(TplFeatureNameDto item);

  /// Delete concrete [TplFeatureNameDto]
  Future<void> delete(TplFeatureNameDto item);

  /// Delete all stored items
  Future<void> deleteAll();

  /// Returns a stream of list of [TplFeatureNameDto] stored in local storage.
  ///
  /// A new event will be emitted whenever an [TplFeatureNameDto] is updated, removed,
  /// or a new [TplFeatureNameDto] is stored.
  Stream<List<TplFeatureNameDto>> watchAllItems();
}
