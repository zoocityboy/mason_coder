import 'package:{{name.snakeCase()}}/features/custom/presentation/cubit/{{name.snakeCase()}}_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('{{name.pascalCase()}}Cubit', () {
    late {{name.pascalCase()}}Cubit bloc;

    setUp(() {
      bloc = {{name.pascalCase()}}Cubit();
    });

    tearDown(() {
      bloc.close();
    });

    // Add more tests for different events and states

    test('initial state should be {{name.pascalCase()}}Initial', () {
      expect(bloc.state, isA<{{name.pascalCase()}}Initial>());
    });

    test('load should emit [Loading, Loaded] states', () async {
      final expected = [isA<{{name.pascalCase()}}Loading>(), isA<{{name.pascalCase()}}Loaded>()];

      expectLater(bloc.stream, emitsInOrder(expected));

      bloc.load();

      await Future.delayed(const Duration(milliseconds: 600));
    });

    test('load should not emit new states if already loading', () async {
      bloc.load();
      bloc.load(); // Second call should be ignored

      final states = [];
      bloc.stream.listen(states.add);

      await Future.delayed(const Duration(milliseconds: 600));

      expect(states.length, 1); // Only Loading and Loaded states
    });
  });
}
