import 'package:wasla/core/common/entities/user.dart';

abstract class ProfileRepository {
  Future<User?> getUserInfo();
}
