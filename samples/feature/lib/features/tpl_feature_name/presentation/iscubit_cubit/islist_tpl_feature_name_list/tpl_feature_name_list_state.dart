part of 'tpl_feature_name_list_cubit.dart';

/// Sealed State class with Equality by [Equatable]
/// GOOD Naming convetion for states
/// BlocSubject + Verb (action) + State
/// ```dart
/// // TplFeatureNameList + Initial + State
/// final class TplFeatureNameListInitialState extends TplFeatureNameListState {}
/// ```

sealed class TplFeatureNameListState extends Equatable {
  const TplFeatureNameListState();
  @override
  List<Object?> get props => [];
}

class TplFeatureNameListInitialState extends TplFeatureNameListState {
  const TplFeatureNameListInitialState();
}

class TplFeatureNameListInProgressState extends TplFeatureNameListState {
  const TplFeatureNameListInProgressState();
}

class TplFeatureNameListLoadSuccessState extends TplFeatureNameListState {
  const TplFeatureNameListLoadSuccessState(this.data);
  final List<TplFeatureNameEntity> data;
  @override
  List<Object?> get props => [...super.props, data];
}

class TplFeatureNameListLoadFailureState extends TplFeatureNameListState {
  const TplFeatureNameListLoadFailureState(this.error);
  final ApiFailure error;
  @override
  List<Object?> get props => [...super.props, error];
}
