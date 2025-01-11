import 'package:{{name.snakeCase()}}/features/{{feature_name.snakeCase()}}/presentation/bloc/{{name.snakeCase()}}_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('{{name.pascalCase()}}Bloc', () {
    late {{name.pascalCase()}}Bloc bloc;

    setUp(() {
      bloc = {{name.pascalCase()}}Bloc();
    });

    tearDown(() {
      bloc.close();
    });

    test('initial state is {{name.pascalCase()}}Initial', () {
      expect(bloc.state, isA<{{name.pascalCase()}}Initial>());
    });

    blocTest<{{name.pascalCase()}}Bloc, {{name.pascalCase()}}State>(
      'emits [] when nothing is added',
      build: () => bloc,
      expect: () => [],
    );

    // Add more tests for different events and states
  });
}
