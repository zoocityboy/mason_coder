part of '{{feature_name.snakeCase()}}_list_bloc.dart';

abstract class {{feature_name.pascalCase()}}ListEvent extends Equatable {
  const {{feature_name.pascalCase()}}ListEvent();
  @override
  List<Object> get props => [];
}

/// Event added when some custom logic happens
class CustomActionPressedEvent extends {{feature_name.pascalCase()}}ListEvent {
  const CustomActionPressedEvent();
}

class FetchListTriggerEvent extends {{feature_name.pascalCase()}}ListEvent {
  const FetchListTriggerEvent({this.page = 0, this.limit = 20});
  final int page;
  final int limit;
  @override
  List<Object> get props => [page, limit];
}
