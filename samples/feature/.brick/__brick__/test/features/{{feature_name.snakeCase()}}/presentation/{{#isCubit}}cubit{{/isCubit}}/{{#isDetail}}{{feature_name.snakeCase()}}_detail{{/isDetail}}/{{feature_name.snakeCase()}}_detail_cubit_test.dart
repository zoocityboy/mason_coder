import 'package:bloc_test/bloc_test.dart';
import 'package:{{packageName.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/entities/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_detail_entity.dart';
import 'package:{{packageName.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
import 'package:{{packageName.snakeCase()}}/features/{{feature_name.snakeCase()}}/presentation/cubit/{{feature_name.snakeCase()}}_detail/{{feature_name.snakeCase()}}_detail_cubit.dart';
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
  group('${{feature_name.pascalCase()}}DetailCubit load events', () {
    late {{feature_name.pascalCase()}}Repository repository;
    late {{feature_name.pascalCase()}}DetailCubit cubit;
    late CancelToken cancelToken;
    setUp(() {
      repository = Mock{{feature_name.pascalCase()}}Repository();
      cancelToken = CancelToken();
      cubit = {{feature_name.pascalCase()}}DetailCubit(repository, cancelToken: cancelToken);
    });
    blocTest<{{feature_name.pascalCase()}}DetailCubit, {{feature_name.pascalCase()}}DetailCubitState>(
      'emits [${{feature_name.pascalCase()}}DetailCubitInProgressState, ${{feature_name.pascalCase()}}DetailCubitLoadSuccessState] when .getById(any) is added.',
      setUp: () {
        when(
          () => repository.getById(any(), token: cancelToken),
        ).thenAnswer((_) async => successData.toSuccess());
      },
      build: () => cubit,
      act: (c) => c.getDetail(1),
      expect: () => <{{feature_name.pascalCase()}}DetailCubitState>[
        const {{feature_name.pascalCase()}}DetailCubitInProgressState(),
        const {{feature_name.pascalCase()}}DetailCubitLoadSuccessState(successData),
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

    blocTest<{{feature_name.pascalCase()}}DetailCubit, {{feature_name.pascalCase()}}DetailCubitState>(
      'emits [${{feature_name.pascalCase()}}DetailCubitInProgressState, ${{feature_name.pascalCase()}}DetailCubitLoadFailureState] when .getById(any) is added.',
      setUp: () {
        when(() => repository.getById(any(), token: cancelToken)).thenAnswer((_) async => fakeException.toFailure());
      },
      build: () => cubit,
      act: (bloc) => bloc.getDetail(1),
      expect: () => <{{feature_name.pascalCase()}}DetailCubitState>[
        const {{feature_name.pascalCase()}}DetailCubitInProgressState(),
        {{feature_name.pascalCase()}}DetailCubitLoadFailureState(fakeException),
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
