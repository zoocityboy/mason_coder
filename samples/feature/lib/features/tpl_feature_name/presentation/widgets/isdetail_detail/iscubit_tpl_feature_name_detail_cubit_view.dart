import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../iscubit_cubit/isdetail_tpl_feature_name_detail/tpl_feature_name_detail_cubit.dart';

class TplFeatureNameDetailCubitView extends StatelessWidget {
  const TplFeatureNameDetailCubitView({
    required this.initial,
    required this.inProgress,
    required this.onFailure,
    required this.onSuccess,
    super.key,
  });
  final WidgetBuilder initial;
  final WidgetBuilder inProgress;
  final TplFeatureNameDetailBlocFailureWidgetBuilder onFailure;
  final TplFeatureNameDetailBlocSuccesWidgetBuilder onSuccess;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TplFeatureNameDetailCubit, TplFeatureNameDetailCubitState>(
      builder: (context, state) {
        return switch (state) {
          TplFeatureNameDetailCubitInitialState() => initial(context),
          TplFeatureNameDetailCubitInProgressState() => inProgress(context),
          TplFeatureNameDetailCubitLoadFailureState(error: final error) => onFailure(context, error),
          TplFeatureNameDetailCubitLoadSuccessState(data: final data) => onSuccess(context, data),
        };
      },
    );
  }
}

typedef TplFeatureNameDetailBlocSuccesWidgetBuilder = Widget Function(
  BuildContext context,
  Object data,
);
typedef TplFeatureNameDetailBlocFailureWidgetBuilder = Widget Function(
  BuildContext context,
  Object data,
);
