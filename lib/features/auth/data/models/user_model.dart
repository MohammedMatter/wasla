import 'package:wasla/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.email,
    required super.name,
    super.password,
    super.id,
  });
}
