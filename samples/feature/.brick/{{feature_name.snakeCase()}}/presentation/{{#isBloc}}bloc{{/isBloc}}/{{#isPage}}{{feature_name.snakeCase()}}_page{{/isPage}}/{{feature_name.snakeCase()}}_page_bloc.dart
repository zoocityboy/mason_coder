import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part '{{feature_name.snakeCase()}}_page_event.dart';
part '{{feature_name.snakeCase()}}_page_state.dart';

class {{feature_name.pascalCase()}}PageBloc extends Bloc<{{feature_name.pascalCase()}}PageEvent, {{feature_name.pascalCase()}}PageState> {
  {{feature_name.pascalCase()}}PageBloc() : super({{feature_name.pascalCase()}}PageInitial()) {
    on<{{feature_name.pascalCase()}}PageEvent>((event, emit) {
      // TODO(platform): implement event handler
    });
  }
}
