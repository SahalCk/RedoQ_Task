part of 'view_users_details_screen_bloc.dart';

@immutable
sealed class ViewUsersDetailsScreenState {}

final class ViewUsersDetailsScreenInitial extends ViewUsersDetailsScreenState {}

final class ViewUsersDetailsScreenActionState
    extends ViewUsersDetailsScreenState {}

final class UserDetailsFetchedState extends ViewUsersDetailsScreenState {
  final List<UserModel> users;

  UserDetailsFetchedState({required this.users});
}

final class EditButtonClickedState extends ViewUsersDetailsScreenActionState {
  final String userId;

  EditButtonClickedState({required this.userId});
}

final class SomethingWentWrongState extends ViewUsersDetailsScreenState {
  final String error;

  SomethingWentWrongState({required this.error});
}
