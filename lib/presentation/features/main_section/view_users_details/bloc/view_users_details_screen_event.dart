part of 'view_users_details_screen_bloc.dart';

@immutable
sealed class ViewUsersDetailsScreenEvent {}

class FetchUsersDetailsEvent extends ViewUsersDetailsScreenEvent {}

class EditButtonClickedEvent extends ViewUsersDetailsScreenEvent {
  final String userId;

  EditButtonClickedEvent({required this.userId});
}
