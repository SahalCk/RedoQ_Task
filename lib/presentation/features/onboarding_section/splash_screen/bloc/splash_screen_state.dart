part of 'splash_screen_bloc.dart';

@immutable
sealed class SplashScreenState {}

final class SplashScreenInitial extends SplashScreenState {}

final class SplashScreenActionState extends SplashScreenState {}

final class UserAlreadyLoggedInState extends SplashScreenActionState {}

final class UserNotLoggedInState extends SplashScreenActionState {}

final class SomethingWentWrongState extends SplashScreenActionState {
  final String error;

  SomethingWentWrongState({required this.error});
}
