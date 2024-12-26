import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../isbloc_bloc/isdetail_tpl_feature_name_detail/tpl_feature_name_detail_bloc.dart';

class TplFeatureNameDetailBlocView extends StatelessWidget {
  const TplFeatureNameDetailBlocView({
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
    return BlocBuilder<TplFeatureNameDetailBloc, TplFeatureNameDetailState>(
      builder: (context, state) {
        return switch (state) {
          TplFeatureNameDetailInitialState() => initial(context),
          TplFeatureNameDetailInProgressState() => inProgress(context),
          TplFeatureNameDetailLoadFailureState(error: final error) => onFailure(context, error),
          TplFeatureNameDetailLoadSuccessState(data: final data) => onSuccess(context, data),
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
