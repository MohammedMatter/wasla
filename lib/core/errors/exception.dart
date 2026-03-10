abstract class AppException implements Exception {
  String message;
  AppException({required this.message});
}

class AuthException extends AppException {
  AuthException({required super.message});
}

class TimeException extends AppException {
  TimeException({required super.message});
}

class SmtpExcption extends AppException {
  SmtpExcption({required super.message});
}
