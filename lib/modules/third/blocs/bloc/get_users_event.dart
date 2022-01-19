part of 'get_users_bloc.dart';

abstract class GetUsersEvent extends Equatable {
  const GetUsersEvent();

  @override
  List<Object> get props => [];
}

class Get extends GetUsersEvent {
  final int page;

  Get(this.page);
  @override
  List<Object> get props => [page];
}

class LoadMore extends GetUsersEvent {
  final List<User> users;

  LoadMore(this.users);
  @override
  List<Object> get props => [users];
}
