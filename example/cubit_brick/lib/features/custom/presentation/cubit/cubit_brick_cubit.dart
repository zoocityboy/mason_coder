import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cubit_brick_state.dart';

class CubitBrickCubit extends Cubit<CubitBrickState> {
  CubitBrickCubit() : super(CubitBrickInitial());

  void load() {
    if (state is CubitBrickLoading) return;
    emit(CubitBrickLoading());
    Future.delayed(Duration(milliseconds: 500))
        .then<List<String>>((_) => List.generate(10, (value) => 'item $value'))
        .then((vaues) {
      emit(CubitBrickLoaded(vaues));
    }).catchError((error) {
      emit(CubitBrickError(error.toString()));
    });
  }
}
