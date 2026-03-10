import 'package:wasla/core/common/entities/user.dart';
import 'package:wasla/features/profile/domain/repositories/profile_repository.dart';

class GetUserInfoUseCase {
  ProfileRepository repository;
  GetUserInfoUseCase({required this.repository});
  Future<User?> call() async {
    return repository.getUserInfo();
  }
}
