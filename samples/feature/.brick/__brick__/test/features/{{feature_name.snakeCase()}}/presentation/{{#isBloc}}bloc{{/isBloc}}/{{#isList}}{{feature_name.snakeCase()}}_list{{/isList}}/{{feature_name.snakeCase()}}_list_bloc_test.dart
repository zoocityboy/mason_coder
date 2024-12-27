import 'package:bloc_test/bloc_test.dart';
import 'package:{{packageName.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/entities/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_detail_entity.dart';
import 'package:{{packageName.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
import 'package:{{packageName.snakeCase()}}/features/{{feature_name.snakeCase()}}/presentation/bloc/{{feature_name.snakeCase()}}_list/{{feature_name.snakeCase()}}_list_bloc.dart';
import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../helpers/helpers.dart';

class Mock{{feature_name.pascalCase()}}Repository extends Mock implements {{feature_name.pascalCase()}}Repository {}

class FakeException extends Fake implements GenericException {}

void main() {
  const id = 1;
  const successData = [
    {{feature_name.pascalCase()}}DetailEntity(
      id: id,
      name: 'name',
    ),
  ];
  final fakeException = FakeException();
  group('${{feature_name.pascalCase()}}ListBloc load events', () {
    late {{feature_name.pascalCase()}}Repository repository;
    late {{feature_name.pascalCase()}}ListBloc bloc;
    late CancelToken cancelToken;
    setUp(() {
      repository = Mock{{feature_name.pascalCase()}}Repository();
      cancelToken = CancelToken();
      bloc = {{feature_name.pascalCase()}}ListBloc(repository, cancelToken: cancelToken);
    });
    blocTest<{{feature_name.pascalCase()}}ListBloc, {{feature_name.pascalCase()}}ListState>(
      'emits [${{feature_name.pascalCase()}}ListInProgressState, ${{feature_name.pascalCase()}}ListLoadSuccessState] when $FetchListTriggerEvent is added.',
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
      expect: () => <{{feature_name.pascalCase()}}ListState>[
        const {{feature_name.pascalCase()}}ListInProgressState(),
        const {{feature_name.pascalCase()}}ListLoadSuccessState(successData),
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

    blocTest<{{feature_name.pascalCase()}}ListBloc, {{feature_name.pascalCase()}}ListState>(
      'emits [${{feature_name.pascalCase()}}ListInProgressState, ${{feature_name.pascalCase()}}ListLoadFailureState] when $FetchListTriggerEvent is added.',
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
      expect: () => <{{feature_name.pascalCase()}}ListState>[
        const {{feature_name.pascalCase()}}ListInProgressState(),
        {{feature_name.pascalCase()}}ListLoadFailureState(fakeException),
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
