abstract class Failure {
  final String message;
  Failure(this.message);
}

class NetworkFailure extends Failure {
  NetworkFailure() : super("Network error occurred");
}

class ServerFailure extends Failure {
  ServerFailure() : super("Server error occurred");
}

class InvalidInputFailure extends Failure {
  InvalidInputFailure() : super("Invalid input provided");
}
