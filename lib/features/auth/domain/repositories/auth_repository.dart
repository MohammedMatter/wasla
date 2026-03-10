import 'package:dartz/dartz.dart';
import 'package:wasla/core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> signUp({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Failure, Unit>> signIn({
    required String email,
    required String password,
  });
  Future<void> signOut();
  Future<Either<Failure, String>> sendOtp({required String email});
}
