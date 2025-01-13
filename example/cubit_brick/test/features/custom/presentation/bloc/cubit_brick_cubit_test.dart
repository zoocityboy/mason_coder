import 'package:cubit_brick/features/custom/presentation/cubit/cubit_brick_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CubitBrickCubit', () {
    late CubitBrickCubit bloc;

    setUp(() {
      bloc = CubitBrickCubit();
    });

    tearDown(() {
      bloc.close();
    });

    // Add more tests for different events and states

    test('initial state should be CubitBrickInitial', () {
      expect(bloc.state, isA<CubitBrickInitial>());
    });

    test('load should emit [Loading, Loaded] states', () async {
      final expected = [isA<CubitBrickLoading>(), isA<CubitBrickLoaded>()];

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
