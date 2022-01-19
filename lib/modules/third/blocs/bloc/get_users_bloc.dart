import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:suitmedia_test/core/error.dart';
import 'package:suitmedia_test/modules/third/data/models/user_response.dart';
import 'package:suitmedia_test/modules/third/data/repositories/user_repository.dart';

part 'get_users_event.dart';
part 'get_users_state.dart';

enum LoadingType { First, More, Max }

class GetUsersBloc extends Bloc<GetUsersEvent, GetUsersState> {
  final UserRepository repository;

  int currPage = 0;
  LoadingType loadingType = LoadingType.First;
  GetUsersBloc(this.repository) : super(GetUsersInitial()) {
    on<Get>(_mapGetEventToState);
    on<LoadMore>(_mapLoadMoreToState);
  }

  FutureOr<void> _mapGetEventToState(event, emit) async {
    currPage = event.page;
    emit(GetUsersLoading(loadingType));
    loadingType = LoadingType.More;
    try {
      var result = await repository.getUsers(page: "$currPage");
      return result.fold((error) async {
        emit(GetUsersError(error));
      }, (result) async {
        if (result.data == null) {
          emit(GetUsersError(Failure("an unknown error")));
        } else {
          _stopNextLoadWhenEmpty(result);
          _stopNextLoadWhenMax(result);
          emit(GetUsersLoaded(result.data!, loadingType));
        }
      });
    } on Exception catch (e) {
      emit(GetUsersError(Failure(e.toString())));
    }
  }

  void _stopNextLoadWhenEmpty(UserResponse result) {
    if ((result.data?.length ?? 0) == 0) {
      //handle getting empty data at first try
      loadingType = LoadingType.Max;
    }
  }

  FutureOr<void> _mapLoadMoreToState(event, emit) async {
    currPage += 1;
    if (loadingType == LoadingType.Max) {
      emit(GetUsersLoaded(event.users, loadingType));
    }

    try {
      var result = await repository.getUsers(page: "$currPage");
      return result.fold((error) async {
        emit(GetUsersError(error));
      }, (result) async {
        if (result.data == null) {
          emit(GetUsersLoaded(event.users, loadingType));
        } else {
          _stopNextLoadWhenMax(result);
          emit(GetUsersLoaded(event.users..addAll(result.data!), loadingType));
        }
      });
    } on Exception catch (e) {
      emit(GetUsersError(Failure(e.toString())));
    }
  }

  void _stopNextLoadWhenMax(UserResponse result) {
    if ((result.data?.length ?? 0) < 10) {
      loadingType = LoadingType.Max;
    }
  }
}
