import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<CheckedUserAlreadyLoggedInEvent>(_checkUserAlreadyLoggedInEvent);
  }

  FutureOr<void> _checkUserAlreadyLoggedInEvent(
      CheckedUserAlreadyLoggedInEvent event,
      Emitter<SplashScreenState> emit) async {
    try {
      await Future.delayed(const Duration(seconds: 1), () {
        emit(UserAlreadyLoggedInState());
      });
    } catch (e) {
      emit(SomethingWentWrongState(error: e.toString()));
    }
  }
}
