import 'package:bloc_test/bloc_test.dart';
import 'package:eit_feature/features/tpl_feature_name/domain/entities/tpl_feature_name/isdetail_tpl_feature_name_detail_entity.dart';
import 'package:eit_feature/features/tpl_feature_name/domain/repositories/tpl_feature_name_repository.dart';
import 'package:eit_feature/features/tpl_feature_name/presentation/isbloc_bloc/islist_tpl_feature_name_list/tpl_feature_name_list_bloc.dart';
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
  group('$TplFeatureNameListBloc load events', () {
    late TplFeatureNameRepository repository;
    late TplFeatureNameListBloc bloc;
    late CancelToken cancelToken;
    setUp(() {
      repository = MockTplFeatureNameRepository();
      cancelToken = CancelToken();
      bloc = TplFeatureNameListBloc(repository, cancelToken: cancelToken);
    });
    blocTest<TplFeatureNameListBloc, TplFeatureNameListState>(
      'emits [$TplFeatureNameListInProgressState, $TplFeatureNameListLoadSuccessState] when $FetchListTriggerEvent is added.',
      build: () {
        when(
          () => repository.getList(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            token: cancelToken,
          ),
        ).thenAnswer((_) async => successData.toSuccess());
        return bloc;
      },
      act: (bloc) => bloc.add(const FetchListTriggerEvent()),
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

    blocTest<TplFeatureNameListBloc, TplFeatureNameListState>(
      'emits [$TplFeatureNameListInProgressState, $TplFeatureNameListLoadFailureState] when $FetchListTriggerEvent is added.',
      setUp: () {
        when(
          () => repository.getList(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            token: cancelToken,
          ),
        ).thenAnswer((_) async => fakeException.toFailure());
      },
      build: () => bloc,
      act: (bloc) => bloc.add(const FetchListTriggerEvent()),
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
