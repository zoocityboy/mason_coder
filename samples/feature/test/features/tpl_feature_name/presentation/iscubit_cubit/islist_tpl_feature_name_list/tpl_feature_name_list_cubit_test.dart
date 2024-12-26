import 'package:bloc_test/bloc_test.dart';
import 'package:eit_feature/features/tpl_feature_name/domain/entities/tpl_feature_name/isdetail_tpl_feature_name_detail_entity.dart';
import 'package:eit_feature/features/tpl_feature_name/domain/repositories/tpl_feature_name_repository.dart';
import 'package:eit_feature/features/tpl_feature_name/presentation/iscubit_cubit/islist_tpl_feature_name_list/tpl_feature_name_list_cubit.dart';
import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../helpers/helpers.dart';

class MockTplFeatureNameRepository extends Mock implements TplFeatureNameRepository {}

class FakeException extends Fake implements GenericException {}

void main() {
  const id = 1;
  const successData = [
    TplFeatureNameDetailEntity(
      id: id,
      name: 'name',
    ),
  ];
  final fakeException = FakeException();
  group('$TplFeatureNameListCubit load events', () {
    late TplFeatureNameRepository repository;
    late TplFeatureNameListCubit cubit;
    late CancelToken cancelToken;
    setUp(() {
      repository = MockTplFeatureNameRepository();
      cancelToken = CancelToken();
      cubit = TplFeatureNameListCubit(repository, cancelToken: cancelToken);
    });
    tearDown(() => cubit.close());
    blocTest<TplFeatureNameListCubit, TplFeatureNameListState>(
      'emits [$TplFeatureNameListInProgressState, $TplFeatureNameListLoadSuccessState] when .list(any, any) is added.',
      setUp: () {
        when(
          () => repository.getList(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            token: cancelToken,
          ),
        ).thenAnswer((_) async => successData.toSuccess());
      },
      build: () => cubit,
      act: (c) => c.list(
        page: 1,
        limit: 100,
      ),
      expect: () => <TplFeatureNameListState>[
        const TplFeatureNameListInProgressState(),
        const TplFeatureNameListLoadSuccessState(successData),
      ],
      verify: (bloc) => verify(
        () => repository.getList(
          page: any(named: 'page'),
          limit: any(named: 'limit'),
          token: cancelToken,
        ),
      ).called(1),
      tags: [
        TestTags.unit,
        TestTags.logic,
      ],
    );

    blocTest<TplFeatureNameListCubit, TplFeatureNameListState>(
      'emits [$TplFeatureNameListInProgressState, $TplFeatureNameListLoadFailureState] when .list(any, any) is added.',
      setUp: () {
        when(
          () => repository.getList(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            token: cancelToken,
          ),
        ).thenAnswer((_) async => fakeException.toFailure());
      },
      build: () => cubit,
      act: (c) => c.list(
        page: 1,
        limit: 100,
      ),
      expect: () => <TplFeatureNameListState>[
        const TplFeatureNameListInProgressState(),
        TplFeatureNameListLoadFailureState(fakeException),
      ],
      verify: (bloc) => verify(
        () => repository.getList(
          page: any(named: 'page'),
          limit: any(named: 'limit'),
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
