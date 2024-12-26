import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/di/injection.dart';
import '../../isbloc_bloc/islist_tpl_feature_name_list/tpl_feature_name_list_bloc.dart';
import '../../widgets/islist_list/isbloc_tpl_feature_name_list_bloc_content_view.dart';

class TplFeatureNameBlocListPage extends StatelessWidget {
  const TplFeatureNameBlocListPage({super.key});
  static const String routeName = 'TplFeatureNameBlocListPage';
  static const String routePath = 'tpl_feature_name_bloc_list_page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<TplFeatureNameListBloc>(),
      child: Scaffold(
        appBar: AppBar(),
        body: const TplFeatureNameListBlocContentView(),
      ),
    );
  }
}
