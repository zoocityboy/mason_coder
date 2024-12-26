// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/tpl_feature_name/tpl_feature_name_entity.dart';
import '../../../domain/repositories/tpl_feature_name_repository.dart';

part 'tpl_feature_name_list_state.dart';

class TplFeatureNameListCubit extends Cubit<TplFeatureNameListState> {
  TplFeatureNameListCubit(this.repository, {CancelToken? cancelToken})
      : _cancelToken = cancelToken ??= CancelToken(),
        super(const TplFeatureNameListInitialState());

  /// The [TplFeatureNameRepository] instance used by the [TplFeatureNameListCubit].
  final TplFeatureNameRepository repository;

  /// A cancel token that can be used to cancel an ongoing operation.
  final CancelToken _cancelToken;

  Future<void> list({int page = 0, int limit = 10}) async {
    emit(const TplFeatureNameListInProgressState());
    await repository
        .getList(page: page, limit: limit, token: _cancelToken)
        .run(
          TplFeatureNameListLoadFailureState.new,
          TplFeatureNameListLoadSuccessState.new,
        )
        .then(emit);
  }

  @override
  Future<void> close() {
    if (!_cancelToken.isCancelled) _cancelToken.cancel();
    return super.close();
  }
}
