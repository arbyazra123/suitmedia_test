import 'package:equatable/equatable.dart';

abstract class ErrorException implements Exception {
  final String? msg;

  ErrorException([this.msg]);
}

class Failure extends ErrorException with EquatableMixin{
  String? msg;

  Failure([this.msg]);

  @override
  List<Object?> get props => [msg];
}
class ConnectionFailure extends ErrorException with EquatableMixin{
  String? msg;

  ConnectionFailure([this.msg]);
  @override
  List<Object?> get props => [msg];
}