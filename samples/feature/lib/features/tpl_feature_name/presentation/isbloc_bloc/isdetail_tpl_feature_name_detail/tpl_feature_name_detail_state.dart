part of 'tpl_feature_name_detail_bloc.dart';

/// Sealed State class with Equality by [Equatable]
///
/// GOOD Naming convetion for states
/// BlocSubject + Verb (action) + State
/// ```dart
/// // TplFeatureNameDetail + Initial + State
/// final class TplFeatureNameDetailInitialState extends TplFeatureNameDetailState {}
/// ```
sealed class TplFeatureNameDetailState extends Equatable {
  const TplFeatureNameDetailState();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

/// Initial state for the [TplFeatureNameDetailBloc].
class TplFeatureNameDetailInitialState extends TplFeatureNameDetailState {
  const TplFeatureNameDetailInitialState();
}

/// Represents the state when the [TplFeatureNameDetailBloc] is in progress.
/// Extends the TplFeatureNameDetailState class.
class TplFeatureNameDetailInProgressState extends TplFeatureNameDetailState {
  const TplFeatureNameDetailInProgressState();
  @override
  List<Object?> get props => [];
}

/// Represents the state when the [TplFeatureNameEntity] data has been successfully loaded.
///
/// Contains the loaded [TplFeatureNameEntity] data.
class TplFeatureNameDetailLoadSuccessState extends TplFeatureNameDetailState {
  const TplFeatureNameDetailLoadSuccessState(this.data);

  /// The loaded [TplFeatureNameEntity] data.
  final TplFeatureNameEntity data;

  @override
  List<Object?> get props => [...super.props, data];
}

/// Represents the state of the [TplFeatureNameDetailBloc] when an API call fails.
/// Contains the [error] that caused the failure.
class TplFeatureNameDetailLoadFailureState extends TplFeatureNameDetailState {
  const TplFeatureNameDetailLoadFailureState(this.error);
  final ApiFailure error;
  @override
  List<Object?> get props => [...super.props, error];
}
