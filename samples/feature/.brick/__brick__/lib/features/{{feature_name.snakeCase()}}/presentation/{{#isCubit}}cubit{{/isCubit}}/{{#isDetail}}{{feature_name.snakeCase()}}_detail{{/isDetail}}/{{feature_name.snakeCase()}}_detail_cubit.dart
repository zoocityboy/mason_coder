import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_detail_entity.dart';
import '../../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';

part '{{feature_name.snakeCase()}}_detail_state.dart';

/// Cubit that manages the state of the {{feature_name.pascalCase()}}Detail feature's detail view.
/// Extends the [Cubit] class and takes [{{feature_name.pascalCase()}}DetailCubitState] as its type parameter.
/// Located at FILEPATH: /Users/zoocityboy/Develop/eit_platform/eli/brick/template/{{packageName.snakeCase()}}/src/lib/features/{{feature_name.snakeCase()}}/application/cubit/{{feature_name.snakeCase()}}_detail/{{feature_name.snakeCase()}}_detail_cubit.dart
class {{feature_name.pascalCase()}}DetailCubit extends Cubit<{{feature_name.pascalCase()}}DetailCubitState> {
  {{feature_name.pascalCase()}}DetailCubit(this.repository, {CancelToken? cancelToken})
      : _cancelToken = cancelToken ??= CancelToken(),
        super(const {{feature_name.pascalCase()}}DetailCubitInitialState());

  /// The repository for the {{feature_name.pascalCase()}} feature.
  final {{feature_name.pascalCase()}}Repository repository;

  /// A cancel token used to cancel an ongoing operation.
  final CancelToken _cancelToken;

  /// Fetches the detail information for the {{feature_name.pascalCase()}}DetailPage screen.
  Future<void> getDetail(int id) async {
    emit(const {{feature_name.pascalCase()}}DetailCubitInProgressState());
    await repository
        .getById(id, token: _cancelToken)
        .run(
          {{feature_name.pascalCase()}}DetailCubitLoadFailureState.new,
          {{feature_name.pascalCase()}}DetailCubitLoadSuccessState.new,
        )
        .then(emit);
  }

  @override
  Future<void> close() {
    if (!_cancelToken.isCancelled) _cancelToken.cancel();
    return super.close();
  }
}
