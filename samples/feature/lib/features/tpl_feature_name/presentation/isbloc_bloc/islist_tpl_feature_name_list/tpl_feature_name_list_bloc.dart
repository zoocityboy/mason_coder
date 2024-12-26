import 'dart:async';

import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/tpl_feature_name/tpl_feature_name_entity.dart';
import '../../../domain/repositories/tpl_feature_name_repository.dart';

part 'tpl_feature_name_list_event.dart';
part 'tpl_feature_name_list_state.dart';

/// Bloc responsible for managing the state of the TplFeatureNameList feature.
/// It receives TplFeatureNameListEvents and emits TplFeatureNameListStates.
/// The initial state is TplFeatureNameListInitial.
class TplFeatureNameListBloc extends Bloc<TplFeatureNameListEvent, TplFeatureNameListState> {
  /// Bloc responsible for managing the state of the TplFeatureNameList screen.
  TplFeatureNameListBloc(this.repository, {CancelToken? cancelToken})
      : _cancelToken = cancelToken ??= CancelToken(),
        super(const TplFeatureNameListInitialState()) {
    /// Registers a callback function to be called whenever a [CustomActionPressedEvent] is dispatched to this bloc.
    on<CustomActionPressedEvent>(onCustomActionPressedEvent);

    /// Registers the [onFetchListTriggerEvent] function to be called when a
    /// [FetchTplFeatureNameListEvent] is dispatched to this bloc.
    on<FetchListTriggerEvent>(onFetchListTriggerEvent);
  }

  /// The [TplFeatureNameListBloc] class is responsible for managing the state of the TplFeatureName list screen.
  /// It takes a [TplFeatureNameRepository] as a dependency to fetch the necessary data.
  final TplFeatureNameRepository repository;

  /// A cancel token that can be used to cancel an asynchronous operation.
  final CancelToken _cancelToken;

  /// Handles the [CustomActionPressedEvent] and updates the [TplFeatureNameListState].
  @protected
  FutureOr<void> onCustomActionPressedEvent(
    CustomActionPressedEvent event,
    Emitter<TplFeatureNameListState> emit,
  ) async {
    // TODO(platform): Add Logic
    // emit(const TplFeatureNameListInProgressState());
    // await repository
    //     .customApiRequest(
    //       token: _cancelToken,
    //     )
    //     .run(
    //       TplFeatureNameListState.onFailure,
    //       TplFeatureNameListState.onSuccess,
    //     )
    //     .then(emit.call);
  }

  /// Handles the [FetchListTriggerEvent] event and updates the state accordingly.
  /// Emits [TplFeatureNameListInProgressState] state before fetching the list from the repository.
  /// If the response is successful, emits [TplFeatureNameListLoadSuccessState] state with the fetched list.
  /// If the response is unsuccessful, emits [TplFeatureNameListLoadFailureState] state with the error message.
  @protected
  FutureOr<void> onFetchListTriggerEvent(
    FetchListTriggerEvent event,
    Emitter<TplFeatureNameListState> emit,
  ) async {
    emit(const TplFeatureNameListInProgressState());
    await repository
        .getList(
          page: event.page,
          limit: event.limit,
          token: _cancelToken,
        )
        .run(
          TplFeatureNameListState.onFailure,
          TplFeatureNameListState.onSuccess,
        )
        .then(emit.call);
  }

  /// Closes the [TplFeatureNameListBloc] and cancels the [_cancelToken].
  ///
  /// Returns a [Future] that completes when the [TplFeatureNameListBloc] is closed.
  @override
  Future<void> close() {
    if (!_cancelToken.isCancelled) _cancelToken.cancel();
    return super.close();
  }
}
