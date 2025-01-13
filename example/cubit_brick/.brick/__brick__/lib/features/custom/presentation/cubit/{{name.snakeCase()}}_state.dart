part of '{{name.snakeCase()}}_cubit.dart';

@immutable
sealed class {{name.pascalCase()}}State {}

final class {{name.pascalCase()}}Initial extends {{name.pascalCase()}}State {}

final class {{name.pascalCase()}}Loading extends {{name.pascalCase()}}State {}

final class {{name.pascalCase()}}Loaded extends {{name.pascalCase()}}State {
  final List<String> items;

  {{name.pascalCase()}}Loaded(this.items);
}

final class {{name.pascalCase()}}Error extends {{name.pascalCase()}}State {
  final String message;

  {{name.pascalCase()}}Error(this.message);
}
