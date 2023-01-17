import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;
  const Failure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class ServerFailure extends Failure {
  const ServerFailure(String errorMessage) : super(errorMessage);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String errorMessage) : super(errorMessage);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(String message) : super(message);
}
