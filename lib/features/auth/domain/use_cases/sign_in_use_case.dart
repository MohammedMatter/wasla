import 'package:dartz/dartz.dart';
import 'package:wasla/core/errors/exception.dart';
import 'package:wasla/core/errors/failure.dart';
import 'package:wasla/features/auth/domain/repositories/auth_repository.dart';

class SignInUseCase {
  AuthRepository authRepository;
  SignInUseCase({required this.authRepository});

  Future<Either<Failure, Unit>> call({
    required String email,
    required String password,
  }) async {
    try {
      await authRepository.signIn(email: email, password: password);
      return right(unit);
    } on AuthException catch (code) {
      return left(AuthFailure(message: code.message));
    }
  }
}
