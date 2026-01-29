import 'package:dartz/dartz.dart';
import 'package:wasla/core/errors/failure.dart';
import 'package:wasla/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:wasla/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRemoteDataSource _authRemoteDataSource = AuthRemoteDataSource();
  @override
  Future<Either<Failure, Unit>> signIn({
    required String email,
    required String password,
  }) {
    return _authRemoteDataSource.signIn(email: email, password: password);
  }

  @override
  Future<Either<Failure, Unit>> signUp({
    required String email,
    required String password,
    required String name,
  }) {
    return _authRemoteDataSource.signUp(
      email: email,
      password: password,
      name: name,
    );
  }

  @override
  Future<void> signOut() {
    return _authRemoteDataSource.signOut();
  }
}
