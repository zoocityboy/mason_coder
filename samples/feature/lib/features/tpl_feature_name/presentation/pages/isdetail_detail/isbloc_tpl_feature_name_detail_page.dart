import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/di/injection.dart';
import '../../isbloc_bloc/isdetail_tpl_feature_name_detail/tpl_feature_name_detail_bloc.dart';
import '../../widgets/isdetail_detail/isbloc_tpl_feature_name_detail_bloc_content_view.dart';

class TplFeatureNameDetailPage extends StatelessWidget {
  const TplFeatureNameDetailPage({super.key});
  static const String routeName = 'TplFeatureNameDetailPage';
  static const String routePath = 'tpl_feature_name_detail_page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<TplFeatureNameDetailBloc>(), // ..add(const TplFeatureNameDetailInitialEvent()),
      child: Scaffold(
        appBar: AppBar(),
        body: const TplFeatureNameDetailBlocContentView(),
      ),
    );
  }
}
