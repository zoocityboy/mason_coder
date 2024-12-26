import 'package:eit_core/eit_core.dart';

import '../../domain/datasources/tpl_feature_name_local_datasource.dart';
import '../models/tpl_feature_name/islist_tpl_feature_name_list_dto.dart';
import 'tpl_feature_name_box.dart';

// TODO(platform): [TplFeatureNameImplLocalDataSource] implement all functions and remove this line!!
class TplFeatureNameLocalDataSourceImpl extends DataSourceRequest implements TplFeatureNameLocalDataSource {
  TplFeatureNameLocalDataSourceImpl({
    required this.box,
  });
  final TplFeatureNameBox box;

  @override
  Future<void> delete(TplFeatureNameDto item) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() {
    // TODO(platform): implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<TplFeatureNameDto?> findById(String id) {
    // TODO(platform): implement findById
    throw UnimplementedError();
  }

  @override
  Future<List<TplFeatureNameDto>> getAll() {
    // TODO(platform): implement getAll
    throw UnimplementedError();
  }

  @override
  Future<TplFeatureNameDto> save(TplFeatureNameDto item) {
    // TODO(platform): implement save
    throw UnimplementedError();
  }

  @override
  Stream<List<TplFeatureNameDto>> watchAllItems() {
    // TODO(platform): implement watchAllAlbums
    throw UnimplementedError();
  }

  @override
  Future<void> clear() => tryRequest(() async {
        await box.clear();
      });
}
