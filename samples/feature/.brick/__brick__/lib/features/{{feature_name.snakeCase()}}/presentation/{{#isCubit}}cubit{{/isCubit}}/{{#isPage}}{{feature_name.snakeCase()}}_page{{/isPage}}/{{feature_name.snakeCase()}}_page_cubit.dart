import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part '{{feature_name.snakeCase()}}_page_state.dart';

class {{feature_name.pascalCase()}}PageCubit extends Cubit<{{feature_name.pascalCase()}}PageState> {
  {{feature_name.pascalCase()}}PageCubit() : super({{feature_name.pascalCase()}}PageInitial());
}
