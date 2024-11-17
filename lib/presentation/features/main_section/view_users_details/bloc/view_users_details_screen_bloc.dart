import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:redoq/data/data_sources/local_data_sources.dart';
import 'package:redoq/model/entities/user_model.dart';

part 'view_users_details_screen_event.dart';
part 'view_users_details_screen_state.dart';

class ViewUsersDetailsScreenBloc
    extends Bloc<ViewUsersDetailsScreenEvent, ViewUsersDetailsScreenState> {
  ViewUsersDetailsScreenBloc() : super(ViewUsersDetailsScreenInitial()) {
    on<FetchUsersDetailsEvent>(_fetchUsersDetailsEvent);
    on<EditButtonClickedEvent>(_edidButtonClickedEvent);
  }

  FutureOr<void> _fetchUsersDetailsEvent(
      FetchUsersDetailsEvent event, Emitter<ViewUsersDetailsScreenState> emit) {
    try {
      final users = LocalDataSources().getUsers;
      emit(UserDetailsFetchedState(users: users));
    } catch (e) {
      emit(SomethingWentWrongState(error: e.toString()));
    }
  }

  FutureOr<void> _edidButtonClickedEvent(
      EditButtonClickedEvent event, Emitter<ViewUsersDetailsScreenState> emit) {
    emit(EditButtonClickedState(userId: event.userId));
  }
}
