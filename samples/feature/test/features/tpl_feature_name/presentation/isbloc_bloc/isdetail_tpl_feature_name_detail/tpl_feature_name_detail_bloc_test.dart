import 'package:bloc_test/bloc_test.dart';
import 'package:eit_feature/features/tpl_feature_name/domain/entities/tpl_feature_name/isdetail_tpl_feature_name_detail_entity.dart';
import 'package:eit_feature/features/tpl_feature_name/domain/repositories/tpl_feature_name_repository.dart';
import 'package:eit_feature/features/tpl_feature_name/presentation/isbloc_bloc/isdetail_tpl_feature_name_detail/tpl_feature_name_detail_bloc.dart';
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
  group('$TplFeatureNameDetailBloc load events', () {
    late TplFeatureNameRepository repository;
    late TplFeatureNameDetailBloc bloc;
    late CancelToken cancelToken;
    setUp(() {
      repository = MockTplFeatureNameRepository();
      cancelToken = CancelToken();
      bloc = TplFeatureNameDetailBloc(repository, cancelToken: cancelToken);
    });
    blocTest<TplFeatureNameDetailBloc, TplFeatureNameDetailState>(
      'emits [$TplFeatureNameDetailInProgressState, $TplFeatureNameDetailLoadSuccessState] when $FetchDetailTriggerEvent is added.',
      setUp: () {
        when(
          () => repository.getById(
            any(),
            token: cancelToken,
          ),
        ).thenAnswer((_) async => successData.toSuccess());
      },
      build: () => bloc,
      act: (bloc) => bloc.add(const FetchDetailTriggerEvent(id: id)),
      expect: () => <TplFeatureNameDetailState>[
        const TplFeatureNameDetailInProgressState(),
        const TplFeatureNameDetailLoadSuccessState(successData),
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

    blocTest<TplFeatureNameDetailBloc, TplFeatureNameDetailState>(
      'emits [$TplFeatureNameDetailInProgressState, $TplFeatureNameDetailLoadFailureState] when $FetchDetailTriggerEvent is added.',
      setUp: () {
        when(() => repository.getById(any(), token: cancelToken)).thenAnswer((_) async => fakeException.toFailure());
      },
      build: () => bloc,
      act: (bloc) => bloc.add(const FetchDetailTriggerEvent(id: id)),
      expect: () => <TplFeatureNameDetailState>[
        const TplFeatureNameDetailInProgressState(),
        TplFeatureNameDetailLoadFailureState(fakeException),
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
