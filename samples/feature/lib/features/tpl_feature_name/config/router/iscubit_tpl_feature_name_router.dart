import 'package:go_router/go_router.dart';

import '../../presentation/pages/isdetail_detail/iscubit_tpl_feature_name_detail_page.dart';
import '../../presentation/pages/islist_list/iscubit_tpl_feature_name_list_page.dart';

List<GoRoute> tplFeatureNameRouter = [
  /*_start_islist*/
  GoRoute(
    name: TplFeatureNameCubitListPage.routeName,
    path: TplFeatureNameCubitListPage.routePath,
    builder: (context, state) => const TplFeatureNameCubitListPage(),
    routes: [
      /*_start_isdetail*/
      GoRoute(
        name: TplFeatureNameDetailPage.routeName,
        path: TplFeatureNameDetailPage.routePath,
        builder: (context, state) => const TplFeatureNameDetailPage(),
      ),
      /*_end_isdetail*/
    ],
  ),
  /*_end_islist*/
];
