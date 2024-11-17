part of 'update_user_details_screen_bloc.dart';

@immutable
sealed class UpdateUserDetailsScreenEvent {}

final class PresetUserDetailsEvent extends UpdateUserDetailsScreenEvent {
  final String userId;

  PresetUserDetailsEvent({required this.userId});
}

final class UpdateUserDetailsEvent extends UpdateUserDetailsScreenEvent {
  final String userId;
  final String name;
  final String age;

  UpdateUserDetailsEvent(
      {required this.userId, required this.name, required this.age});
}
