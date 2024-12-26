import 'dart:async';

import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/tpl_feature_name/tpl_feature_name_entity.dart';
import '../../../domain/repositories/tpl_feature_name_repository.dart';

part 'tpl_feature_name_detail_event.dart';
part 'tpl_feature_name_detail_state.dart';

class TplFeatureNameDetailBloc extends Bloc<TplFeatureNameDetailEvent, TplFeatureNameDetailState> {
  /// Inject the [repository]
  TplFeatureNameDetailBloc(this.repository, {CancelToken? cancelToken})
      : _cancelToken = cancelToken ??= CancelToken(),
        super(const TplFeatureNameDetailInitialState()) {
    on<StopActionPressedEvent>(onStopActionPressed);
    on<FetchDetailTriggerEvent>(onFetchDetailTrigger);
  }

  /// Inject the [repository]
  final TplFeatureNameRepository repository;

  /// Cancel requests with [_cancelToken] when repository close
  final CancelToken _cancelToken;

  @protected
  FutureOr<void> onStopActionPressed(
    StopActionPressedEvent event,
    Emitter<TplFeatureNameDetailState> emit,
  ) {
    // TODO(platform): Add Logic
    // if (!_cancelToken.isCancelled) {
    //   _cancelToken.cancel('stop_action');
    //   emit(const TplFeatureNameDetailInitialState());
    // }
  }

  @protected
  FutureOr<void> onFetchDetailTrigger(
    FetchDetailTriggerEvent event,
    Emitter<TplFeatureNameDetailState> emit,
  ) async {
    emit(const TplFeatureNameDetailInProgressState());
    await repository
        .getById(event.id, token: _cancelToken)
        .run(
          TplFeatureNameDetailLoadFailureState.new,
          TplFeatureNameDetailLoadSuccessState.new,
        )
        .then(emit.call);
  }

  @override
  Future<void> close() {
    if (!_cancelToken.isCancelled) _cancelToken.cancel();
    return super.close();
  }
}
