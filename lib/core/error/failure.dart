import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;
  final int statusCode;

  const Failure(this.errorMessage, this.statusCode);
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure({String errorMessage = '', int statusCode = 0})
      : super(errorMessage, statusCode);
}

class CacheFailure extends Failure {
  const CacheFailure({String errorMessage = '', int statusCode = 0})
      : super(errorMessage, statusCode);
}
