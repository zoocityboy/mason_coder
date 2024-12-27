import 'package:eit_injection/eit_injection.dart';

import '../../domain/datasources/{{feature_name.snakeCase()}}_local_datasource.dart';
import '../../domain/datasources/{{feature_name.snakeCase()}}_remote_datasource.dart';
import '../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
import '../../infrastructure/datasources/{{feature_name.snakeCase()}}_box.dart';
import '../../infrastructure/datasources/{{feature_name.snakeCase()}}_local_data_source_impl.dart';
import '../../infrastructure/datasources/{{feature_name.snakeCase()}}_remote_data_source_impl.dart';
import '../../infrastructure/repositories/{{feature_name.snakeCase()}}_repository_impl.dart';
{{#isBloc}}
import '../../presentation/bloc/{{feature_name.snakeCase()}}_detail/{{feature_name.snakeCase()}}_detail_bloc.dart';
import '../../presentation/bloc/{{feature_name.snakeCase()}}_list/{{feature_name.snakeCase()}}_list_bloc.dart';
{{/isBloc}}
{{#isCubit}}
import '../../presentation/cubit/{{feature_name.snakeCase()}}_detail/{{feature_name.snakeCase()}}_detail_cubit.dart';
import '../../presentation/cubit/{{feature_name.snakeCase()}}_list/{{feature_name.snakeCase()}}_list_cubit.dart';

{{/isCubit}}
part '{{feature_name.snakeCase()}}_injection.fake.dart';

class {{feature_name.pascalCase()}}Injection extends InjectableFeature {
  {{feature_name.pascalCase()}}Injection(super.locator);

  @override
  Future<void> preRegister() async {
    registerSingleton<{{feature_name.pascalCase()}}Box>({{feature_name.pascalCase()}}Box());
  }

  @override
  void register() {
    registerSingleton<{{feature_name.pascalCase()}}LocalDataSource>(
      {{feature_name.pascalCase()}}LocalDataSourceImpl(box: get()),
    );

    registerFactory<{{feature_name.pascalCase()}}RemoteDataSource>(
      {{feature_name.pascalCase()}}RemoteDataSourceImpl.new,
    );

    registerFactory<{{feature_name.pascalCase()}}Repository>(
      {{feature_name.pascalCase()}}RepositoryImpl.new,
    );
    {{#isBloc}}
    {{#isDetail}}
    registerFactory<{{feature_name.pascalCase()}}DetailBloc>(
      () => {{feature_name.pascalCase()}}DetailBloc(get<{{feature_name.pascalCase()}}Repository>()),
    );
    {{/isDetail}}
    {{#isList}}
    registerFactory<{{feature_name.pascalCase()}}ListBloc>(
      () => {{feature_name.pascalCase()}}ListBloc(get<{{feature_name.pascalCase()}}Repository>()),
    );
    {{/isList}}
    {{/isBloc}}

    {{#isCubit}}
    {{#isDetail}}
    registerFactory<{{feature_name.pascalCase()}}DetailCubit>(
      () => {{feature_name.pascalCase()}}DetailCubit(get<{{feature_name.pascalCase()}}Repository>()),
    );
    {{/isDetail}}

    {{#isList}}
    registerFactory<{{feature_name.pascalCase()}}ListCubit>(
      () => {{feature_name.pascalCase()}}ListCubit(get<{{feature_name.pascalCase()}}Repository>()),
    );
    {{/isList}}
    {{/isCubit}}
  }

  @override
  void dependecyOverride() {
    // registerFactory<{{feature_name.pascalCase()}}LocalDataSource>(
    //   () => {{feature_name.pascalCase()}}ImplLocalDataSource(box: locator.get()),
    // );
  }
}
