part of 'tpl_feature_name_detail_bloc.dart';

/// Sealed Event class with Equality by [Equatable]

/// GOOD Naming convetion for events
/// BlocSubject + Verb (action) + Event
/// ```dart
/// // Eitbloc + Started + Event
/// final class EitblocStartedEvent extends EitblocEvent {}
/// ```
sealed class TplFeatureNameDetailEvent extends Equatable {
  const TplFeatureNameDetailEvent();
  @override
  List<Object> get props => [];
}

/// DetailEvent added when some custom logic happens
class StopActionPressedEvent extends TplFeatureNameDetailEvent {
  const StopActionPressedEvent();
  @override
  List<Object> get props => [];
}

/// An event that represents fetching details of a TplFeatureName.
///
/// This event is used to trigger the fetching of details of a TplFeatureName
/// with the given [id]. If no [id] is provided, the default value of -1 is used.

class FetchDetailTriggerEvent extends TplFeatureNameDetailEvent {
  const FetchDetailTriggerEvent({this.id = -1});
  final int id;
  @override
  List<Object> get props => [...super.props, id];
}
