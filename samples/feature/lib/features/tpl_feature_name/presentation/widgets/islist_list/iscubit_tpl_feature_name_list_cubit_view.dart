import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../iscubit_cubit/islist_tpl_feature_name_list/tpl_feature_name_list_cubit.dart';

class TplFeatureNameListCubitView extends StatelessWidget {
  const TplFeatureNameListCubitView({
    required this.initial,
    required this.inProgress,
    required this.onFailure,
    required this.onSuccess,
    super.key,
  });
  final WidgetBuilder initial;
  final WidgetBuilder inProgress;
  final TplFeatureNameListFailureWidgetBuilder onFailure;
  final TplFeatureNameListSuccesWidgetBuilder onSuccess;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TplFeatureNameListCubit, TplFeatureNameListState>(
      builder: (context, state) {
        return switch (state) {
          TplFeatureNameListInitialState() => initial(context),
          TplFeatureNameListInProgressState() => inProgress(context),
          TplFeatureNameListLoadFailureState(error: final error) => onFailure(context, error),
          TplFeatureNameListLoadSuccessState(data: final data) => onSuccess(context, data),
        };
      },
    );
  }
}

typedef TplFeatureNameListSuccesWidgetBuilder = Widget Function(
  BuildContext context,
  Object data,
);
typedef TplFeatureNameListFailureWidgetBuilder = Widget Function(
  BuildContext context,
  Object data,
);
