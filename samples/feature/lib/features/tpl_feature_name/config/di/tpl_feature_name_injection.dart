import 'package:eit_injection/eit_injection.dart';

import '../../domain/datasources/tpl_feature_name_local_datasource.dart';
import '../../domain/datasources/tpl_feature_name_remote_datasource.dart';
import '../../domain/repositories/tpl_feature_name_repository.dart';
import '../../infrastructure/datasources/tpl_feature_name_box.dart';
import '../../infrastructure/datasources/tpl_feature_name_local_data_source_impl.dart';
import '../../infrastructure/datasources/tpl_feature_name_remote_data_source_impl.dart';
import '../../infrastructure/repositories/tpl_feature_name_repository_impl.dart';
/*_start_isbloc*/
import '../../presentation/isbloc_bloc/isdetail_tpl_feature_name_detail/tpl_feature_name_detail_bloc.dart';
import '../../presentation/isbloc_bloc/islist_tpl_feature_name_list/tpl_feature_name_list_bloc.dart';
/*_end_isbloc*/
/*_start_iscubit*/
import '../../presentation/iscubit_cubit/isdetail_tpl_feature_name_detail/tpl_feature_name_detail_cubit.dart';
import '../../presentation/iscubit_cubit/islist_tpl_feature_name_list/tpl_feature_name_list_cubit.dart';

/*_end_iscubit*/
part 'tpl_feature_name_injection.fake.dart';

class TplFeatureNameInjection extends InjectableFeature {
  TplFeatureNameInjection(super.locator);

  @override
  Future<void> preRegister() async {
    registerSingleton<TplFeatureNameBox>(TplFeatureNameBox());
  }

  @override
  void register() {
    registerSingleton<TplFeatureNameLocalDataSource>(
      TplFeatureNameLocalDataSourceImpl(box: get()),
    );

    registerFactory<TplFeatureNameRemoteDataSource>(
      TplFeatureNameRemoteDataSourceImpl.new,
    );

    registerFactory<TplFeatureNameRepository>(
      TplFeatureNameRepositoryImpl.new,
    );
    /*_start_isbloc*/
    /*_start_isdetail*/
    registerFactory<TplFeatureNameDetailBloc>(
      () => TplFeatureNameDetailBloc(get<TplFeatureNameRepository>()),
    );
    /*_end_isdetail*/
    /*_start_islist*/
    registerFactory<TplFeatureNameListBloc>(
      () => TplFeatureNameListBloc(get<TplFeatureNameRepository>()),
    );
    /*_end_islist*/
    /*_end_isbloc*/

    /*_start_iscubit*/
    /*_start_isdetail*/
    registerFactory<TplFeatureNameDetailCubit>(
      () => TplFeatureNameDetailCubit(get<TplFeatureNameRepository>()),
    );
    /*_end_isdetail*/

    /*_start_islist*/
    registerFactory<TplFeatureNameListCubit>(
      () => TplFeatureNameListCubit(get<TplFeatureNameRepository>()),
    );
    /*_end_islist*/
    /*_end_iscubit*/
  }

  @override
  void dependecyOverride() {
    // registerFactory<TplFeatureNameLocalDataSource>(
    //   () => TplFeatureNameImplLocalDataSource(box: locator.get()),
    // );
  }
}
