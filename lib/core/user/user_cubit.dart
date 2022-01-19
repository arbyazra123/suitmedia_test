import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:suitmedia_test/modules/third/data/models/user_response.dart';
import 'package:suitmedia_test/shared/snackbar_helper.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState.initial());

  onNameChanged(String text) {
    emit(state.copyWith(name: text));
  }

  addOrRemoveUser(User user, BuildContext context) {
    if (_isUserExists(user)) {
      _removeUser(user);
      SnackBarHelper.showMessage(
          context, "${user.firstName} ${user.lastName} deleted");
      return;
    }

    SnackBarHelper.showMessage(
        context, "${user.firstName} ${user.lastName} added");
    _addUser(user);
  }

  void _addUser(User user) {
    return emit(state.copyWith(
        selectedUsers:
            SavedUser(List.of([...state.selectedUsers.users, user]))));
  }

  bool _isUserExists(User user) {
    return state.selectedUsers.users
            .where((element) => element.id == user.id)
            .length >
        0;
  }

  _removeUser(User user) {
    state.selectedUsers.users.remove(user);
    emit(state.copyWith(
        selectedUsers: SavedUser(List.of(state.selectedUsers.users))));
  }
}
