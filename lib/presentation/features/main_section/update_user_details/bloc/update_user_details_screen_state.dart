part of 'update_user_details_screen_bloc.dart';

@immutable
sealed class UpdateUserDetailsScreenState {}

final class UpdateUserDetailsScreenInitial
    extends UpdateUserDetailsScreenState {}

final class UpdateUserDetailsScreenActionState
    extends UpdateUserDetailsScreenState {}

final class UserDetailsPresetState extends UpdateUserDetailsScreenState {
  final UserModel userModel;

  UserDetailsPresetState({required this.userModel});
}

final class UserDetailsUpdateSuccessState
    extends UpdateUserDetailsScreenActionState {}

final class UserDetailsUpdateFailedState
    extends UpdateUserDetailsScreenActionState {
  final String error;

  UserDetailsUpdateFailedState({required this.error});
}

final class SomethingWentWrongState extends UpdateUserDetailsScreenState {
  final String error;

  SomethingWentWrongState({required this.error});
}
