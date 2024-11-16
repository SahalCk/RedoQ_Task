import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<CheckUserAlreadyLoggedInEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1), () {
        emit(UserAlreadyLoggedInState());
        return;
      });
    });
  }
}
