import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'tpl_feature_name_page_state.dart';

class TplFeatureNamePageCubit extends Cubit<TplFeatureNamePageState> {
  TplFeatureNamePageCubit() : super(TplFeatureNamePageInitial());
}
