part of '{{feature_name.snakeCase()}}_detail_bloc.dart';

/// Sealed Event class with Equality by [Equatable]

/// GOOD Naming convetion for events
/// BlocSubject + Verb (action) + Event
/// ```dart
/// // Eitbloc + Started + Event
/// final class EitblocStartedEvent extends EitblocEvent {}
/// ```
sealed class {{feature_name.pascalCase()}}DetailEvent extends Equatable {
  const {{feature_name.pascalCase()}}DetailEvent();
  @override
  List<Object> get props => [];
}

/// DetailEvent added when some custom logic happens
class StopActionPressedEvent extends {{feature_name.pascalCase()}}DetailEvent {
  const StopActionPressedEvent();
  @override
  List<Object> get props => [];
}

/// An event that represents fetching details of a {{feature_name.pascalCase()}}.
///
/// This event is used to trigger the fetching of details of a {{feature_name.pascalCase()}}
/// with the given [id]. If no [id] is provided, the default value of -1 is used.

class FetchDetailTriggerEvent extends {{feature_name.pascalCase()}}DetailEvent {
  const FetchDetailTriggerEvent({this.id = -1});
  final int id;
  @override
  List<Object> get props => [...super.props, id];
}
