import 'package:dartz/dartz.dart';
import 'package:wasla/core/errors/exception.dart';
import 'package:wasla/core/errors/failure.dart';
import 'package:wasla/features/auth/data/repositories_impl/auth_repository_impl.dart';

class SignInUseCase {
  AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl();
  Future<Either<Failure, Unit>> call({
    required String email,
    required String password,
  }) async {
    try {
      await authRepositoryImpl.signIn(email: email, password: password);
      return right(unit);
    } on AuthException catch (code) {
      return left(AuthFailure(message: code.message));
    }
  }
}
