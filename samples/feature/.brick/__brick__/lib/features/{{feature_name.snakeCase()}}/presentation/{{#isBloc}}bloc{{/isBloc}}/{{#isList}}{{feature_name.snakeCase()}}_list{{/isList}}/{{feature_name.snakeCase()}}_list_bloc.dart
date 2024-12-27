import 'dart:async';

import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_entity.dart';
import '../../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';

part '{{feature_name.snakeCase()}}_list_event.dart';
part '{{feature_name.snakeCase()}}_list_state.dart';

/// Bloc responsible for managing the state of the {{feature_name.pascalCase()}}List feature.
/// It receives {{feature_name.pascalCase()}}ListEvents and emits {{feature_name.pascalCase()}}ListStates.
/// The initial state is {{feature_name.pascalCase()}}ListInitial.
class {{feature_name.pascalCase()}}ListBloc extends Bloc<{{feature_name.pascalCase()}}ListEvent, {{feature_name.pascalCase()}}ListState> {
  /// Bloc responsible for managing the state of the {{feature_name.pascalCase()}}List screen.
  {{feature_name.pascalCase()}}ListBloc(this.repository, {CancelToken? cancelToken})
      : _cancelToken = cancelToken ??= CancelToken(),
        super(const {{feature_name.pascalCase()}}ListInitialState()) {
    /// Registers a callback function to be called whenever a [CustomActionPressedEvent] is dispatched to this bloc.
    on<CustomActionPressedEvent>(onCustomActionPressedEvent);

    /// Registers the [onFetchListTriggerEvent] function to be called when a
    /// [Fetch{{feature_name.pascalCase()}}ListEvent] is dispatched to this bloc.
    on<FetchListTriggerEvent>(onFetchListTriggerEvent);
  }

  /// The [{{feature_name.pascalCase()}}ListBloc] class is responsible for managing the state of the {{feature_name.pascalCase()}} list screen.
  /// It takes a [{{feature_name.pascalCase()}}Repository] as a dependency to fetch the necessary data.
  final {{feature_name.pascalCase()}}Repository repository;

  /// A cancel token that can be used to cancel an asynchronous operation.
  final CancelToken _cancelToken;

  /// Handles the [CustomActionPressedEvent] and updates the [{{feature_name.pascalCase()}}ListState].
  @protected
  FutureOr<void> onCustomActionPressedEvent(
    CustomActionPressedEvent event,
    Emitter<{{feature_name.pascalCase()}}ListState> emit,
  ) async {
    // TODO(platform): Add Logic
    // emit(const {{feature_name.pascalCase()}}ListInProgressState());
    // await repository
    //     .customApiRequest(
    //       token: _cancelToken,
    //     )
    //     .run(
    //       {{feature_name.pascalCase()}}ListState.onFailure,
    //       {{feature_name.pascalCase()}}ListState.onSuccess,
    //     )
    //     .then(emit.call);
  }

  /// Handles the [FetchListTriggerEvent] event and updates the state accordingly.
  /// Emits [{{feature_name.pascalCase()}}ListInProgressState] state before fetching the list from the repository.
  /// If the response is successful, emits [{{feature_name.pascalCase()}}ListLoadSuccessState] state with the fetched list.
  /// If the response is unsuccessful, emits [{{feature_name.pascalCase()}}ListLoadFailureState] state with the error message.
  @protected
  FutureOr<void> onFetchListTriggerEvent(
    FetchListTriggerEvent event,
    Emitter<{{feature_name.pascalCase()}}ListState> emit,
  ) async {
    emit(const {{feature_name.pascalCase()}}ListInProgressState());
    await repository
        .getList(
          page: event.page,
          limit: event.limit,
          token: _cancelToken,
        )
        .run(
          {{feature_name.pascalCase()}}ListState.onFailure,
          {{feature_name.pascalCase()}}ListState.onSuccess,
        )
        .then(emit.call);
  }

  /// Closes the [{{feature_name.pascalCase()}}ListBloc] and cancels the [_cancelToken].
  ///
  /// Returns a [Future] that completes when the [{{feature_name.pascalCase()}}ListBloc] is closed.
  @override
  Future<void> close() {
    if (!_cancelToken.isCancelled) _cancelToken.cancel();
    return super.close();
  }
}
