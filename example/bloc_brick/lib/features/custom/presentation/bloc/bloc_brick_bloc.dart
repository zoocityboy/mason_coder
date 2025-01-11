import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bloc_brick_event.dart';
part 'bloc_brick_state.dart';

class BlocBrickBloc extends Bloc<BlocBrickEvent, BlocBrickState> {
  BlocBrickBloc() : super(BlocBrickInitial()) {
    on<BlocBrickEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
