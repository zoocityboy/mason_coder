import 'package:go_router/go_router.dart';

import '../../presentation/pages/isdetail_detail/isbloc_tpl_feature_name_detail_page.dart';
import '../../presentation/pages/islist_list/isbloc_tpl_feature_name_list_page.dart';

/*_start_isdetail*/
GoRoute tplFeatureNameDetailRoute = GoRoute(
  name: TplFeatureNameDetailPage.routeName,
  path: TplFeatureNameDetailPage.routePath,
  builder: (context, state) => const TplFeatureNameDetailPage(),
);
/*_end_isdetail*/
/*_start_islist*/
GoRoute tplFeatureNameListRoute = GoRoute(
  name: TplFeatureNameBlocListPage.routeName,
  path: TplFeatureNameBlocListPage.routePath,
  builder: (context, state) => const TplFeatureNameBlocListPage(),
  /*_start_isdetail*/
  routes: [
    tplFeatureNameDetailRoute,
  ],
  /*_end_isdetail*/
);
/*_end_islist*/
List<GoRoute> tplFeatureNameRouter = [
  /*_start_islist*/
  tplFeatureNameListRoute,
  /*_end_islist*/
];
