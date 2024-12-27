part of '{{feature_name.snakeCase()}}_detail_cubit.dart';

/// Represents the state of the {{feature_name.pascalCase()}}DetailCubit.
/// Can be one of the following:
/// - [{{feature_name.pascalCase()}}DetailInitial]: the initial state before any data is loaded.
/// - [{{feature_name.pascalCase()}}DetailLoading]: the state when data is being loaded.
/// - [{{feature_name.pascalCase()}}DetailLoaded]: the state when data has been successfully loaded.
/// - [{{feature_name.pascalCase()}}DetailError]: the state when an error occurs while loading data.

sealed class {{feature_name.pascalCase()}}DetailCubitState extends Equatable {
  const {{feature_name.pascalCase()}}DetailCubitState();
  @override
  List<Object?> get props => [];
  @override
  bool? get stringify => true;
}

/// The initial state for the {{feature_name.pascalCase()}}DetailCubit.
class {{feature_name.pascalCase()}}DetailCubitInitialState extends {{feature_name.pascalCase()}}DetailCubitState {
  const {{feature_name.pascalCase()}}DetailCubitInitialState();
}

/// Represents the state of the {{feature_name.pascalCase()}}DetailCubit when it is in progress.
class {{feature_name.pascalCase()}}DetailCubitInProgressState extends {{feature_name.pascalCase()}}DetailCubitState {
  const {{feature_name.pascalCase()}}DetailCubitInProgressState();
}

/// State emitted by {{feature_name.pascalCase()}}DetailCubit when the feature detail data is successfully loaded.
class {{feature_name.pascalCase()}}DetailCubitLoadSuccessState extends {{feature_name.pascalCase()}}DetailCubitState {
  const {{feature_name.pascalCase()}}DetailCubitLoadSuccessState(this.data);

  /// The state of the {{feature_name.pascalCase()}}DetailDetail screen.
  /// Contains the [{{feature_name.pascalCase()}}DetailEntity] data to be displayed.
  final {{feature_name.pascalCase()}}DetailEntity data;
  @override
  List<Object?> get props => [...super.props, data];
}

/// The state representing a failure state for the {{feature_name.pascalCase()}}DetailCubit.
class {{feature_name.pascalCase()}}DetailCubitLoadFailureState extends {{feature_name.pascalCase()}}DetailCubitState {
  const {{feature_name.pascalCase()}}DetailCubitLoadFailureState(this.error);

  /// The error that occurred while fetching the data from the API.
  final Object error;
  @override
  List<Object?> get props => [...super.props, error];
}
