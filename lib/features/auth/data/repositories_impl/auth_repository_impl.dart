// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:wasla/core/errors/failure.dart';
import 'package:wasla/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:wasla/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, Unit>> signIn({
    required String email,
    required String password,
  }) {
    return authRemoteDataSource.signIn(email: email, password: password);
  }

  @override
  Future<Either<Failure, Unit>> signUp({
    required String email,
    required String password,
    required String name,
  }) {
    return authRemoteDataSource.signUp(
      email: email,
      password: password,
      name: name,
    );
  }

  @override
  Future<void> signOut() {
    return authRemoteDataSource.signOut();
  }
}
