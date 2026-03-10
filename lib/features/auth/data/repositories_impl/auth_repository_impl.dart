// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:wasla/core/errors/exception.dart';

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
  }) async {
    try {
      await authRemoteDataSource.signIn(email: email, password: password);
      return right(unit);
    } on AuthException catch (code) {
      return left(AuthFailure(message: code.message));
    } on TimeException catch (e) {
      return left(TimeOutFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      await authRemoteDataSource.signUp(
        email: email,
        password: password,
        name: name,
      );
      return right(unit);
    } on AuthException catch (code) {
      return left(AuthFailure(message: code.message));
    }
  }

  @override
  Future<void> signOut() {
    return authRemoteDataSource.signOut();
  }

  @override
  Future<Either<Failure, String>> sendOtp({required String email}) async {
    try {
      return await authRemoteDataSource.sendOtp(email: email);
    } on SmtpExcption catch (_) {
      return left(
        SmtpFailure(
          message:
              'عذراً، تعذر إرسال الرمز حالياً. يرجى التأكد من صحة البريد الإلكتروني والمحاولة لاحقاً.',
        ),
      );
    } on Exception catch (_) {
      return left(ServerFailure(message: 'هنالك خطا , نرجو المحاولة لاحقا'));
    }
  }
}
