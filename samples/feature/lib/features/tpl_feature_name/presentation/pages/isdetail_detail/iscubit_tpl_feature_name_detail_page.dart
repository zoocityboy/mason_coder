import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/di/injection.dart';
import '../../iscubit_cubit/isdetail_tpl_feature_name_detail/tpl_feature_name_detail_cubit.dart';
import '../../widgets/isdetail_detail/iscubit_tpl_feature_name_detail_cubit_content_view.dart';

/// A page widget that displays the details of a TplFeatureName item.
///
/// This page is used to display the details of a TplFeatureName item and is
/// navigated to using the [routeName] or [routePath] constants.
class TplFeatureNameDetailPage extends StatelessWidget {
  const TplFeatureNameDetailPage({super.key});
  static const String routeName = 'TplFeatureNameDetailPage';
  static const String routePath = 'tpl_feature_name_detail_page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<TplFeatureNameDetailCubit>(),
      child: Scaffold(
        appBar: AppBar(),
        body: const TplFeatureNameDetailCubitContentView(),
      ),
    );
  }
}
