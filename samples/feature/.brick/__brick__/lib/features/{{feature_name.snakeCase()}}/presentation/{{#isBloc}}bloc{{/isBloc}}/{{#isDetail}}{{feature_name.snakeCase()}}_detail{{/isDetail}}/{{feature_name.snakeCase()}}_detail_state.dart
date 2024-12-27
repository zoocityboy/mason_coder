part of '{{feature_name.snakeCase()}}_detail_bloc.dart';

/// Sealed State class with Equality by [Equatable]
///
/// GOOD Naming convetion for states
/// BlocSubject + Verb (action) + State
/// ```dart
/// // {{feature_name.pascalCase()}}Detail + Initial + State
/// final class {{feature_name.pascalCase()}}DetailInitialState extends {{feature_name.pascalCase()}}DetailState {}
/// ```
sealed class {{feature_name.pascalCase()}}DetailState extends Equatable {
  const {{feature_name.pascalCase()}}DetailState();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

/// Initial state for the [{{feature_name.pascalCase()}}DetailBloc].
class {{feature_name.pascalCase()}}DetailInitialState extends {{feature_name.pascalCase()}}DetailState {
  const {{feature_name.pascalCase()}}DetailInitialState();
}

/// Represents the state when the [{{feature_name.pascalCase()}}DetailBloc] is in progress.
/// Extends the {{feature_name.pascalCase()}}DetailState class.
class {{feature_name.pascalCase()}}DetailInProgressState extends {{feature_name.pascalCase()}}DetailState {
  const {{feature_name.pascalCase()}}DetailInProgressState();
  @override
  List<Object?> get props => [];
}

/// Represents the state when the [{{feature_name.pascalCase()}}Entity] data has been successfully loaded.
///
/// Contains the loaded [{{feature_name.pascalCase()}}Entity] data.
class {{feature_name.pascalCase()}}DetailLoadSuccessState extends {{feature_name.pascalCase()}}DetailState {
  const {{feature_name.pascalCase()}}DetailLoadSuccessState(this.data);

  /// The loaded [{{feature_name.pascalCase()}}Entity] data.
  final {{feature_name.pascalCase()}}Entity data;

  @override
  List<Object?> get props => [...super.props, data];
}

/// Represents the state of the [{{feature_name.pascalCase()}}DetailBloc] when an API call fails.
/// Contains the [error] that caused the failure.
class {{feature_name.pascalCase()}}DetailLoadFailureState extends {{feature_name.pascalCase()}}DetailState {
  const {{feature_name.pascalCase()}}DetailLoadFailureState(this.error);
  final ApiFailure error;
  @override
  List<Object?> get props => [...super.props, error];
}
