import 'package:wasla/core/common/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.email,
    required super.name,
    super.password,
    super.id,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'email': email};
  }

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      password: json['password'],
      id: json['id'],
    );
  }
}
