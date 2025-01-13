import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit() : super({{name.pascalCase()}}Initial());

  void load() {
    if (state is {{name.pascalCase()}}Loading) return;
    emit({{name.pascalCase()}}Loading());
    Future.delayed(Duration(milliseconds: 500))
        .then<List<String>>((_) => List.generate(10, (value) => 'item $value'))
        .then((vaues) {
      emit({{name.pascalCase()}}Loaded(vaues));
    }).catchError((error) {
      emit({{name.pascalCase()}}Error(error.toString()));
    });
  }
}
