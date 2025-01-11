import 'package:bloc_brick/features/custom/presentation/bloc/bloc_brick_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BlocBrickBloc', () {
    late BlocBrickBloc bloc;

    setUp(() {
      bloc = BlocBrickBloc();
    });

    tearDown(() {
      bloc.close();
    });

    test('initial state is BlocBrickInitial', () {
      expect(bloc.state, isA<BlocBrickInitial>());
    });

    blocTest<BlocBrickBloc, BlocBrickState>(
      'emits [] when nothing is added',
      build: () => bloc,
      expect: () => [],
    );

    // Add more tests for different events and states
  });
}
