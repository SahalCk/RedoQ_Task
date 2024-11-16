part of 'splash_screen_bloc.dart';

@immutable
sealed class SplashScreenState {}

final class SplashScreenInitial extends SplashScreenState {}

final class UserAlreadyLoggedInState extends SplashScreenState {}

final class UserNotLoggedInState extends SplashScreenState {}

final class SomethingWentWrongState extends SplashScreenState {}
