part of 'get_users_bloc.dart';

abstract class GetUsersState extends Equatable {
  const GetUsersState();
  
  @override
  List<Object> get props => [];
}

class GetUsersInitial extends GetUsersState {}
class GetUsersLoading extends GetUsersState {
  final LoadingType loadMoreLoading;

  GetUsersLoading(this.loadMoreLoading);
  @override
  List<Object> get props => [loadMoreLoading];
}
class GetUsersError extends GetUsersState {
  final ErrorException error;

  GetUsersError(this.error);
  @override
  List<Object> get props => [error];
}
class GetUsersLoaded extends GetUsersState {
  final List<User> result;
  final LoadingType loadingType;
  GetUsersLoaded(this.result, this.loadingType);
  @override
  List<Object> get props => [result,loadingType];
}
