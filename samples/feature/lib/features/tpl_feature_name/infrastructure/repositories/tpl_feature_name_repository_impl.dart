import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';

/*_start_isdetail*/ import '../../domain/entities/tpl_feature_name/isdetail_tpl_feature_name_detail_entity.dart'; /*_end_isdetail*/
import '../../domain/entities/tpl_feature_name/tpl_feature_name_entity.dart';
import '../../domain/repositories/tpl_feature_name_repository.dart';

class TplFeatureNameRepositoryImpl implements TplFeatureNameRepository {
  /*_start_islist*/
  @override
  Future<Result<ApiFailure, TplFeatureNameEntities>> getList({
    int page = 0,
    int limit = 20,
    CancelToken? token,
  }) {
    throw UnimplementedError();
  }
  /*_end_islist*/

  /*_start_isdetail*/
  @override
  Future<Result<ApiFailure, TplFeatureNameDetailEntity>> getById(
    int id, {
    CancelToken? token,
  }) {
    throw UnimplementedError();
  }
  /*_end_isdetail*/
}
