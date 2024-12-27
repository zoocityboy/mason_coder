import 'package:bloc_test/bloc_test.dart';
import 'package:{{packageName.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/entities/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_detail_entity.dart';
import 'package:{{packageName.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
import 'package:{{packageName.snakeCase()}}/features/{{feature_name.snakeCase()}}/presentation/bloc/{{feature_name.snakeCase()}}_detail/{{feature_name.snakeCase()}}_detail_bloc.dart';
import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../helpers/helpers.dart';

class Mock{{feature_name.pascalCase()}}Repository extends Mock implements {{feature_name.pascalCase()}}Repository {}

class FakeException extends Fake implements GenericException {}

void main() {
  const id = 1;
  const successData = {{feature_name.pascalCase()}}DetailEntity(
    id: id,
    name: 'name',
  );
  final fakeException = FakeException();
  group('${{feature_name.pascalCase()}}DetailBloc load events', () {
    late {{feature_name.pascalCase()}}Repository repository;
    late {{feature_name.pascalCase()}}DetailBloc bloc;
    late CancelToken cancelToken;
    setUp(() {
      repository = Mock{{feature_name.pascalCase()}}Repository();
      cancelToken = CancelToken();
      bloc = {{feature_name.pascalCase()}}DetailBloc(repository, cancelToken: cancelToken);
    });
    blocTest<{{feature_name.pascalCase()}}DetailBloc, {{feature_name.pascalCase()}}DetailState>(
      'emits [${{feature_name.pascalCase()}}DetailInProgressState, ${{feature_name.pascalCase()}}DetailLoadSuccessState] when $FetchDetailTriggerEvent is added.',
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
      expect: () => <{{feature_name.pascalCase()}}DetailState>[
        const {{feature_name.pascalCase()}}DetailInProgressState(),
        const {{feature_name.pascalCase()}}DetailLoadSuccessState(successData),
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

    blocTest<{{feature_name.pascalCase()}}DetailBloc, {{feature_name.pascalCase()}}DetailState>(
      'emits [${{feature_name.pascalCase()}}DetailInProgressState, ${{feature_name.pascalCase()}}DetailLoadFailureState] when $FetchDetailTriggerEvent is added.',
      setUp: () {
        when(() => repository.getById(any(), token: cancelToken)).thenAnswer((_) async => fakeException.toFailure());
      },
      build: () => bloc,
      act: (bloc) => bloc.add(const FetchDetailTriggerEvent(id: id)),
      expect: () => <{{feature_name.pascalCase()}}DetailState>[
        const {{feature_name.pascalCase()}}DetailInProgressState(),
        {{feature_name.pascalCase()}}DetailLoadFailureState(fakeException),
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
