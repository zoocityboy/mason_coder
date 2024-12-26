import 'dart:async';

import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';

/*_start_isdetail*/ import '../../domain/entities/tpl_feature_name/isdetail_tpl_feature_name_detail_entity.dart'; /*_end_isdetail*/
import '../../domain/entities/tpl_feature_name/tpl_feature_name_entity.dart';
import '../../domain/repositories/tpl_feature_name_repository.dart';
import '../models/tpl_feature_name/isdetail_tpl_feature_name_detail_dto.dart';
import '../models/tpl_feature_name/islist_tpl_feature_name_list_dto.dart';

class TplFeatureNameRepositoryFake implements TplFeatureNameRepository {
  /*_start_islist*/
  @override
  Future<Result<ApiFailure, TplFeatureNameEntities>> getList({
    int page = 0,
    int limit = 20,
    CancelToken? token,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    final result = List.generate(limit, (index) => TplFeatureNameDto(id: index));
    final items = result.toEntities();
    return items.toSuccess();
  }

  /*_end_islist*/
  /*_start_isdetail*/
  @override
  Future<Result<ApiFailure, TplFeatureNameDetailEntity>> getById(
    int id, {
    CancelToken? token,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    const item = TplFeatureNameDetailDto(id: 1, name: 'Name');
    return item.toEntity().toSuccess();
  }
  /*_end_isdetail*/
}
