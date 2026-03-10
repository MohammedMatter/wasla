// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:wasla/core/errors/failure.dart';
import 'package:wasla/features/auth/domain/repositories/auth_repository.dart';

class SendOtpUseCase {
  AuthRepository repository;
  SendOtpUseCase({required this.repository});

  Future<Either<Failure, String>> call({required String email}) {
    return repository.sendOtp(email: email);
  }
}
