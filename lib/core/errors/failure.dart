abstract class Failure {
  String message;
  Failure({required this.message});
}

class AuthFailure extends Failure {
  AuthFailure({required super.message});
}

class TimeOutFailure extends Failure {
  TimeOutFailure({required super.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}

class SmtpFailure extends Failure {
  SmtpFailure({required super.message});
}
