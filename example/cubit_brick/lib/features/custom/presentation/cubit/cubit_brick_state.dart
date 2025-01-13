part of 'cubit_brick_cubit.dart';

@immutable
sealed class CubitBrickState {}

final class CubitBrickInitial extends CubitBrickState {}

final class CubitBrickLoading extends CubitBrickState {}

final class CubitBrickLoaded extends CubitBrickState {
  final List<String> items;

  CubitBrickLoaded(this.items);
}

final class CubitBrickError extends CubitBrickState {
  final String message;

  CubitBrickError(this.message);
}
