import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:redoq/data/data_sources/local_data_sources.dart';
import 'package:redoq/model/entities/user_model.dart';

part 'update_user_details_screen_event.dart';
part 'update_user_details_screen_state.dart';

class UpdateUserDetailsScreenBloc
    extends Bloc<UpdateUserDetailsScreenEvent, UpdateUserDetailsScreenState> {
  UpdateUserDetailsScreenBloc() : super(UpdateUserDetailsScreenInitial()) {
    on<PresetUserDetailsEvent>(_presetUserDetailsEvent);
    on<UpdateUserDetailsEvent>(_updateUserDetailsEvent);
  }

  FutureOr<void> _presetUserDetailsEvent(PresetUserDetailsEvent event,
      Emitter<UpdateUserDetailsScreenState> emit) {
    final userHierarchy = event.userId.split('.');
    final users = LocalDataSources().getUsers;

    final targetUser = _findUser(users, userHierarchy);
    if (targetUser != null) {
      emit(UserDetailsPresetState(userModel: targetUser));
    } else {
      emit(UserDetailsUpdateFailedState(error: 'User not found'));
    }
  }
}

FutureOr<void> _updateUserDetailsEvent(
    UpdateUserDetailsEvent event, Emitter<UpdateUserDetailsScreenState> emit) {
  final userHierarchy = event.userId.split('.');
  final users = LocalDataSources().getUsers;

  final targetUser = _findUser(users, userHierarchy);
  if (targetUser != null) {
    if (targetUser.userName != event.name || targetUser.userAge != event.age) {
      targetUser.userName = event.name;
      targetUser.userAge = event.age;
      emit(UserDetailsUpdateSuccessState());
    } else {
      emit(UserDetailsUpdateFailedState(
          error: "You haven't made any changes in the user details"));
    }
  } else {
    emit(UserDetailsUpdateFailedState(error: "User not found"));
  }
}

UserModel? _findUser(List<UserModel> users, List<String> hierarchy) {
  try {
    UserModel? user = users[int.parse(hierarchy[0]) - 1];

    for (int i = 1; i < hierarchy.length; i++) {
      if (hierarchy[i] == '0') {
        break;
      }
      user = user?.child?[int.parse(hierarchy[i]) - 1];
    }

    return user;
  } catch (e) {
    return null;
  }
}
