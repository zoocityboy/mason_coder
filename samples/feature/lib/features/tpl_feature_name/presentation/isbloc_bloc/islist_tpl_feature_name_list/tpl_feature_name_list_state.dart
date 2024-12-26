part of 'tpl_feature_name_list_bloc.dart';

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

  @override
  bool? get stringify => true;

  static TplFeatureNameListState onFailure(ApiFailure error) => TplFeatureNameListLoadFailureState(error);

  static TplFeatureNameListState onSuccess(List<TplFeatureNameEntity> data) => TplFeatureNameListLoadSuccessState(data);
}

/// Initial state for the TplFeatureNameListBloc.
/// This state is emitted when the bloc is first initialized.
class TplFeatureNameListInitialState extends TplFeatureNameListState {
  const TplFeatureNameListInitialState();
  @override
  List<Object?> get props => [];
}

/// Represents the state when the TplFeatureNameList is in a loading state.
/// Extends the [TplFeatureNameListState] abstract class.
class TplFeatureNameListInProgressState extends TplFeatureNameListState {
  const TplFeatureNameListInProgressState();
}

/// Represents the state of the TplFeatureNameList when it is loaded with data.
///
/// Contains a list of [TplFeatureNameEntity] objects.
class TplFeatureNameListLoadSuccessState extends TplFeatureNameListState {
  const TplFeatureNameListLoadSuccessState(this.data);
  final List<TplFeatureNameEntity> data;
  @override
  List<Object?> get props => [...super.props, data];
}

/// Represents the state of the TplFeatureNameListBloc when an error occurs while fetching data.
/// Extends the [TplFeatureNameListState] class.
class TplFeatureNameListLoadFailureState extends TplFeatureNameListState {
  const TplFeatureNameListLoadFailureState(this.error);
  final ApiFailure error;
  @override
  List<Object?> get props => [...super.props, error];
}
