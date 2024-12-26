part of '{{feature_name.snakeCase()}}_list_cubit.dart';

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
}

class {{feature_name.pascalCase()}}ListInitialState extends {{feature_name.pascalCase()}}ListState {
  const {{feature_name.pascalCase()}}ListInitialState();
}

class {{feature_name.pascalCase()}}ListInProgressState extends {{feature_name.pascalCase()}}ListState {
  const {{feature_name.pascalCase()}}ListInProgressState();
}

class {{feature_name.pascalCase()}}ListLoadSuccessState extends {{feature_name.pascalCase()}}ListState {
  const {{feature_name.pascalCase()}}ListLoadSuccessState(this.data);
  final List<{{feature_name.pascalCase()}}Entity> data;
  @override
  List<Object?> get props => [...super.props, data];
}

class {{feature_name.pascalCase()}}ListLoadFailureState extends {{feature_name.pascalCase()}}ListState {
  const {{feature_name.pascalCase()}}ListLoadFailureState(this.error);
  final ApiFailure error;
  @override
  List<Object?> get props => [...super.props, error];
}
