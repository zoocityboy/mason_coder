part of '{{feature_name.snakeCase()}}_list_bloc.dart';

/// Sealed State class with Equality by [Equatable]
/// GOOD Naming convetion for states
/// BlocSubject + Verb (action) + State
/// ```dart
/// // {{feature_name.pascalCase()}}List + Initial + State
/// final class {{feature_name.pascalCase()}}ListInitialState extends {{feature_name.pascalCase()}}ListState {}
/// ```

sealed class {{feature_name.pascalCase()}}ListState extends Equatable {
  const {{feature_name.pascalCase()}}ListState();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;

  static {{feature_name.pascalCase()}}ListState onFailure(ApiFailure error) => {{feature_name.pascalCase()}}ListLoadFailureState(error);

  static {{feature_name.pascalCase()}}ListState onSuccess(List<{{feature_name.pascalCase()}}Entity> data) => {{feature_name.pascalCase()}}ListLoadSuccessState(data);
}

/// Initial state for the {{feature_name.pascalCase()}}ListBloc.
/// This state is emitted when the bloc is first initialized.
class {{feature_name.pascalCase()}}ListInitialState extends {{feature_name.pascalCase()}}ListState {
  const {{feature_name.pascalCase()}}ListInitialState();
  @override
  List<Object?> get props => [];
}

/// Represents the state when the {{feature_name.pascalCase()}}List is in a loading state.
/// Extends the [{{feature_name.pascalCase()}}ListState] abstract class.
class {{feature_name.pascalCase()}}ListInProgressState extends {{feature_name.pascalCase()}}ListState {
  const {{feature_name.pascalCase()}}ListInProgressState();
}

/// Represents the state of the {{feature_name.pascalCase()}}List when it is loaded with data.
///
/// Contains a list of [{{feature_name.pascalCase()}}Entity] objects.
class {{feature_name.pascalCase()}}ListLoadSuccessState extends {{feature_name.pascalCase()}}ListState {
  const {{feature_name.pascalCase()}}ListLoadSuccessState(this.data);
  final List<{{feature_name.pascalCase()}}Entity> data;
  @override
  List<Object?> get props => [...super.props, data];
}

/// Represents the state of the {{feature_name.pascalCase()}}ListBloc when an error occurs while fetching data.
/// Extends the [{{feature_name.pascalCase()}}ListState] class.
class {{feature_name.pascalCase()}}ListLoadFailureState extends {{feature_name.pascalCase()}}ListState {
  const {{feature_name.pascalCase()}}ListLoadFailureState(this.error);
  final ApiFailure error;
  @override
  List<Object?> get props => [...super.props, error];
}
