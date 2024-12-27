// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_entity.dart';
import '../../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';

part '{{feature_name.snakeCase()}}_list_state.dart';

class {{feature_name.pascalCase()}}ListCubit extends Cubit<{{feature_name.pascalCase()}}ListState> {
  {{feature_name.pascalCase()}}ListCubit(this.repository, {CancelToken? cancelToken})
      : _cancelToken = cancelToken ??= CancelToken(),
        super(const {{feature_name.pascalCase()}}ListInitialState());

  /// The [{{feature_name.pascalCase()}}Repository] instance used by the [{{feature_name.pascalCase()}}ListCubit].
  final {{feature_name.pascalCase()}}Repository repository;

  /// A cancel token that can be used to cancel an ongoing operation.
  final CancelToken _cancelToken;

  Future<void> list({int page = 0, int limit = 10}) async {
    emit(const {{feature_name.pascalCase()}}ListInProgressState());
    await repository
        .getList(page: page, limit: limit, token: _cancelToken)
        .run(
          {{feature_name.pascalCase()}}ListLoadFailureState.new,
          {{feature_name.pascalCase()}}ListLoadSuccessState.new,
        )
        .then(emit);
  }

  @override
  Future<void> close() {
    if (!_cancelToken.isCancelled) _cancelToken.cancel();
    return super.close();
  }
}
