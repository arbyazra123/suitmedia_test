import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:suitmedia_test/core/error.dart';
import 'package:suitmedia_test/modules/third/data/models/user_response.dart';
import 'package:suitmedia_test/shared/network.dart';

abstract class UserRepository {
  Future<Either<ErrorException, UserResponse>> getUsers({String? page});
}

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either<ErrorException, UserResponse>> getUsers({String? page}) async {
    var url = "https://reqres.in/api/users?page=${page??'1'}&per_page=10";
    Response response = await Network().getRequest(url);
    if(response.statusCode==200){
      return Right(userResponseFromJson(response.body));
    } else {
      return Left(Failure("an unkown error"));
    }
  }
}
