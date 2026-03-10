// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:wasla/core/errors/failure.dart';
import 'package:wasla/features/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  AuthRepository authRepository;
  SignUpUseCase({required this.authRepository});
  Future<Either<Failure, Unit>> call({
    required String email,
    required String password,
    required String name,
  }) async {
    return authRepository.signUp(email: email, password: password, name: name);
  }
}
