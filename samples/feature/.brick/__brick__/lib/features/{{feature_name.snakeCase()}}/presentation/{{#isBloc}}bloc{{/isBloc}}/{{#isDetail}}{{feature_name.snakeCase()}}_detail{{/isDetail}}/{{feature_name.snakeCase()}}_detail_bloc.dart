import 'dart:async';

import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_entity.dart';
import '../../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';

part '{{feature_name.snakeCase()}}_detail_event.dart';
part '{{feature_name.snakeCase()}}_detail_state.dart';

class {{feature_name.pascalCase()}}DetailBloc extends Bloc<{{feature_name.pascalCase()}}DetailEvent, {{feature_name.pascalCase()}}DetailState> {
  /// Inject the [repository]
  {{feature_name.pascalCase()}}DetailBloc(this.repository, {CancelToken? cancelToken})
      : _cancelToken = cancelToken ??= CancelToken(),
        super(const {{feature_name.pascalCase()}}DetailInitialState()) {
    on<StopActionPressedEvent>(onStopActionPressed);
    on<FetchDetailTriggerEvent>(onFetchDetailTrigger);
  }

  /// Inject the [repository]
  final {{feature_name.pascalCase()}}Repository repository;

  /// Cancel requests with [_cancelToken] when repository close
  final CancelToken _cancelToken;

  @protected
  FutureOr<void> onStopActionPressed(
    StopActionPressedEvent event,
    Emitter<{{feature_name.pascalCase()}}DetailState> emit,
  ) {
    // TODO(platform): Add Logic
    // if (!_cancelToken.isCancelled) {
    //   _cancelToken.cancel('stop_action');
    //   emit(const {{feature_name.pascalCase()}}DetailInitialState());
    // }
  }

  @protected
  FutureOr<void> onFetchDetailTrigger(
    FetchDetailTriggerEvent event,
    Emitter<{{feature_name.pascalCase()}}DetailState> emit,
  ) async {
    emit(const {{feature_name.pascalCase()}}DetailInProgressState());
    await repository
        .getById(event.id, token: _cancelToken)
        .run(
          {{feature_name.pascalCase()}}DetailLoadFailureState.new,
          {{feature_name.pascalCase()}}DetailLoadSuccessState.new,
        )
        .then(emit.call);
  }

  @override
  Future<void> close() {
    if (!_cancelToken.isCancelled) _cancelToken.cancel();
    return super.close();
  }
}
