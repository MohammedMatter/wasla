import 'package:wasla/features/auth/data/repositories_impl/auth_repository_impl.dart';

class SignOutUseCase {
  AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl();
  Future<void> signOut() {
    return authRepositoryImpl.signOut();
  }
}
