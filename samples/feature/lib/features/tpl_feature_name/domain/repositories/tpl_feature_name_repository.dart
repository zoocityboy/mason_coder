import 'package:eit_core/eit_core.dart';
import 'package:eit_networking/eit_networking.dart';

/*_start_isdetail*/ import '../entities/tpl_feature_name/isdetail_tpl_feature_name_detail_entity.dart'; /*_end_isdetail*/
import '../entities/tpl_feature_name/tpl_feature_name_entity.dart';

abstract class TplFeatureNameRepository implements Repository {
  /*_start_islist*/
  Future<Result<ApiFailure, TplFeatureNameEntities>> getList({
    int page = 0,
    int limit = 20,
    CancelToken? token,
  });
  /*_end_islist*/

  /*_start_isdetail*/
  Future<Result<ApiFailure, TplFeatureNameDetailEntity>> getById(
    int id, {
    CancelToken? token,
  });
  /*_end_isdetail*/
}
