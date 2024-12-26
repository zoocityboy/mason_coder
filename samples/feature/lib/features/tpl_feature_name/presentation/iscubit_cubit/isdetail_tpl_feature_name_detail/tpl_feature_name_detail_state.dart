part of 'tpl_feature_name_detail_cubit.dart';

/// Represents the state of the TplFeatureNameDetailCubit.
/// Can be one of the following:
/// - [TplFeatureNameDetailInitial]: the initial state before any data is loaded.
/// - [TplFeatureNameDetailLoading]: the state when data is being loaded.
/// - [TplFeatureNameDetailLoaded]: the state when data has been successfully loaded.
/// - [TplFeatureNameDetailError]: the state when an error occurs while loading data.

sealed class TplFeatureNameDetailCubitState extends Equatable {
  const TplFeatureNameDetailCubitState();
  @override
  List<Object?> get props => [];
  @override
  bool? get stringify => true;
}

/// The initial state for the TplFeatureNameDetailCubit.
class TplFeatureNameDetailCubitInitialState extends TplFeatureNameDetailCubitState {
  const TplFeatureNameDetailCubitInitialState();
}

/// Represents the state of the TplFeatureNameDetailCubit when it is in progress.
class TplFeatureNameDetailCubitInProgressState extends TplFeatureNameDetailCubitState {
  const TplFeatureNameDetailCubitInProgressState();
}

/// State emitted by TplFeatureNameDetailCubit when the feature detail data is successfully loaded.
class TplFeatureNameDetailCubitLoadSuccessState extends TplFeatureNameDetailCubitState {
  const TplFeatureNameDetailCubitLoadSuccessState(this.data);

  /// The state of the TplFeatureNameDetailDetail screen.
  /// Contains the [TplFeatureNameDetailEntity] data to be displayed.
  final TplFeatureNameDetailEntity data;
  @override
  List<Object?> get props => [...super.props, data];
}

/// The state representing a failure state for the TplFeatureNameDetailCubit.
class TplFeatureNameDetailCubitLoadFailureState extends TplFeatureNameDetailCubitState {
  const TplFeatureNameDetailCubitLoadFailureState(this.error);

  /// The error that occurred while fetching the data from the API.
  final Object error;
  @override
  List<Object?> get props => [...super.props, error];
}
