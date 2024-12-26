part of 'tpl_feature_name_list_bloc.dart';

abstract class TplFeatureNameListEvent extends Equatable {
  const TplFeatureNameListEvent();
  @override
  List<Object> get props => [];
}

/// Event added when some custom logic happens
class CustomActionPressedEvent extends TplFeatureNameListEvent {
  const CustomActionPressedEvent();
}

class FetchListTriggerEvent extends TplFeatureNameListEvent {
  const FetchListTriggerEvent({this.page = 0, this.limit = 20});
  final int page;
  final int limit;
  @override
  List<Object> get props => [page, limit];
}
