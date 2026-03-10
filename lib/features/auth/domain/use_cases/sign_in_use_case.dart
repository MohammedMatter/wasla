import 'package:dartz/dartz.dart';
import 'package:wasla/core/errors/failure.dart';
import 'package:wasla/features/auth/domain/repositories/auth_repository.dart';

class SignInUseCase {
  AuthRepository authRepository;
  SignInUseCase({required this.authRepository});

  Future<Either<Failure, Unit>> call({
    required String email,
    required String password,
  }) async {
    return authRepository.signIn(email: email, password: password);
  }
}
