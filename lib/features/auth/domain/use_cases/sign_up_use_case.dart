// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:wasla/core/errors/exception.dart';
import 'package:wasla/core/errors/failure.dart';
import 'package:wasla/features/auth/data/repositories_impl/auth_repository_impl.dart';
import 'package:wasla/features/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  AuthRepository authRepository;
  SignUpUseCase({required this.authRepository});
  Future<Either<Failure, Unit>> call({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      await authRepository.signUp(email: email, password: password, name: name);
      return right(unit);
    } on AuthException catch (code) {
      return left(AuthFailure(message: code.message));
    }
  }
}
