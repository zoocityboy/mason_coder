part of '{{feature_name.snakeCase()}}_injection.dart';

class Fake{{feature_name.pascalCase()}}Injection extends InjectableFeature {
  Fake{{feature_name.pascalCase()}}Injection(super.locator);

  @override
  void register() {
    //_do_not_remove_register_
  }
}
