part of 'splash_screen_bloc.dart';

@immutable
sealed class SplashScreenEvent {}

final class CheckUserAlreadyLoggedInEvent extends SplashScreenEvent {}
