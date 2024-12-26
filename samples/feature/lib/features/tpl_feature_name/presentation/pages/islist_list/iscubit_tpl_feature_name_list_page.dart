import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/di/injection.dart';
import '../../iscubit_cubit/islist_tpl_feature_name_list/tpl_feature_name_list_cubit.dart';
import '../../widgets/islist_list/iscubit_tpl_feature_name_list_cubit_content_view.dart';

class TplFeatureNameCubitListPage extends StatelessWidget {
  const TplFeatureNameCubitListPage({super.key});
  static const String routeName = 'TplFeatureNameCubitListPage';
  static const String routePath = 'tpl_feature_name_cubit_list_page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<TplFeatureNameListCubit>(),
      child: Scaffold(
        appBar: AppBar(),
        body: const TplFeatureNameListCubitContentView(),
      ),
    );
  }
}
