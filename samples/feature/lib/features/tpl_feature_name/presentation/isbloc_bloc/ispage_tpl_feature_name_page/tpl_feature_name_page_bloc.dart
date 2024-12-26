import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'tpl_feature_name_page_event.dart';
part 'tpl_feature_name_page_state.dart';

class TplFeatureNamePageBloc extends Bloc<TplFeatureNamePageEvent, TplFeatureNamePageState> {
  TplFeatureNamePageBloc() : super(TplFeatureNamePageInitial()) {
    on<TplFeatureNamePageEvent>((event, emit) {
      // TODO(platform): implement event handler
    });
  }
}
