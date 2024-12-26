import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/tpl_feature_name/isdetail_tpl_feature_name_detail_entity.dart';
import '../../../domain/repositories/tpl_feature_name_repository.dart';

part 'tpl_feature_name_detail_state.dart';

/// Cubit that manages the state of the TplFeatureNameDetail feature's detail view.
/// Extends the [Cubit] class and takes [TplFeatureNameDetailCubitState] as its type parameter.
/// Located at FILEPATH: /Users/zoocityboy/Develop/eit_platform/eli/brick/template/eit_feature/src/lib/features/tpl_feature_name/application/iscubit_cubit/isdetail_tpl_feature_name_detail/tpl_feature_name_detail_cubit.dart
class TplFeatureNameDetailCubit extends Cubit<TplFeatureNameDetailCubitState> {
  TplFeatureNameDetailCubit(this.repository, {CancelToken? cancelToken})
      : _cancelToken = cancelToken ??= CancelToken(),
        super(const TplFeatureNameDetailCubitInitialState());

  /// The repository for the TplFeatureName feature.
  final TplFeatureNameRepository repository;

  /// A cancel token used to cancel an ongoing operation.
  final CancelToken _cancelToken;

  /// Fetches the detail information for the TplFeatureNameDetailPage screen.
  Future<void> getDetail(int id) async {
    emit(const TplFeatureNameDetailCubitInProgressState());
    await repository
        .getById(id, token: _cancelToken)
        .run(
          TplFeatureNameDetailCubitLoadFailureState.new,
          TplFeatureNameDetailCubitLoadSuccessState.new,
        )
        .then(emit);
  }

  @override
  Future<void> close() {
    if (!_cancelToken.isCancelled) _cancelToken.cancel();
    return super.close();
  }
}
