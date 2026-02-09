import 'package:wasla/features/auth/domain/repositories/auth_repository.dart';
import 'package:wasla/features/profile/domain/repositories/profile_repository.dart';

class SignOutUseCase {
  AuthRepository repository;
  SignOutUseCase({required this.repository});
  Future<void> call() {
    return repository.signOut();
  }
}
