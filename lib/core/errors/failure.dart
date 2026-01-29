abstract class Failure {
  String message;
  Failure({required this.message});
}

class AuthFailure extends Failure {
  AuthFailure({required super.message});
}
