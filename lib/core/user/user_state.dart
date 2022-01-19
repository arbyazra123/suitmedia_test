part of 'user_cubit.dart';

class SavedUser {
  final List<User> users;

  SavedUser(this.users);
}

class UserState extends Equatable {
  final String name;
  final SavedUser selectedUsers;
  factory UserState.initial() =>
      UserState(name: "", selectedUsers: SavedUser([]));

  UserState({required this.name, required this.selectedUsers});
  UserState copyWith({String? name, SavedUser? selectedUsers}) => UserState(
      name: name ?? this.name,
      selectedUsers: selectedUsers ?? this.selectedUsers);

  bool get isValid => name.isNotEmpty;

  @override
  List<Object?> get props => [name, selectedUsers];
}
