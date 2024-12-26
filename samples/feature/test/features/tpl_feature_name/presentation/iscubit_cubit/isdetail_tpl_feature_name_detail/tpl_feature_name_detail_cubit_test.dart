import 'package:bloc_test/bloc_test.dart';
import 'package:eit_feature/features/tpl_feature_name/domain/entities/tpl_feature_name/isdetail_tpl_feature_name_detail_entity.dart';
import 'package:eit_feature/features/tpl_feature_name/domain/repositories/tpl_feature_name_repository.dart';
import 'package:eit_feature/features/tpl_feature_name/presentation/iscubit_cubit/isdetail_tpl_feature_name_detail/tpl_feature_name_detail_cubit.dart';
import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../helpers/helpers.dart';

class MockTplFeatureNameRepository extends Mock implements TplFeatureNameRepository {}

class FakeException extends Fake implements GenericException {}

void main() {
  const id = 1;
  const successData = TplFeatureNameDetailEntity(
    id: id,
    name: 'name',
  );
  final fakeException = FakeException();
  group('$TplFeatureNameDetailCubit load events', () {
    late TplFeatureNameRepository repository;
    late TplFeatureNameDetailCubit cubit;
    late CancelToken cancelToken;
    setUp(() {
      repository = MockTplFeatureNameRepository();
      cancelToken = CancelToken();
      cubit = TplFeatureNameDetailCubit(repository, cancelToken: cancelToken);
    });
    blocTest<TplFeatureNameDetailCubit, TplFeatureNameDetailCubitState>(
      'emits [$TplFeatureNameDetailCubitInProgressState, $TplFeatureNameDetailCubitLoadSuccessState] when .getById(any) is added.',
      setUp: () {
        when(
          () => repository.getById(any(), token: cancelToken),
        ).thenAnswer((_) async => successData.toSuccess());
      },
      build: () => cubit,
      act: (c) => c.getDetail(1),
      expect: () => <TplFeatureNameDetailCubitState>[
        const TplFeatureNameDetailCubitInProgressState(),
        const TplFeatureNameDetailCubitLoadSuccessState(successData),
      ],
      verify: (bloc) => verify(
        () => repository.getById(
          any(),
          token: cancelToken,
        ),
      ).called(1),
      tags: [
        TestTags.unit,
        TestTags.logic,
      ],
    );

    blocTest<TplFeatureNameDetailCubit, TplFeatureNameDetailCubitState>(
      'emits [$TplFeatureNameDetailCubitInProgressState, $TplFeatureNameDetailCubitLoadFailureState] when .getById(any) is added.',
      setUp: () {
        when(() => repository.getById(any(), token: cancelToken)).thenAnswer((_) async => fakeException.toFailure());
      },
      build: () => cubit,
      act: (bloc) => bloc.getDetail(1),
      expect: () => <TplFeatureNameDetailCubitState>[
        const TplFeatureNameDetailCubitInProgressState(),
        TplFeatureNameDetailCubitLoadFailureState(fakeException),
      ],
      verify: (bloc) => verify(
        () => repository.getById(
          any(),
          token: cancelToken,
        ),
      ).called(1),
      tags: [
        TestTags.unit,
        TestTags.logic,
      ],
    );
  });
}
