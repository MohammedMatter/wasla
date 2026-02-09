import 'package:flutter/material.dart';
import 'package:wasla/core/common/entities/user.dart';
import 'package:wasla/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:wasla/features/profile/domain/use_cases/get_user_info_use_case.dart';

class ProfileViewModel extends ChangeNotifier {
  bool isSignout = false;
  ProfileViewModel({required this.getUserInfoUseCase}) {
    getUserInfo();
  }
  User? currentUser;

  GetUserInfoUseCase getUserInfoUseCase;

  Future<void> getUserInfo() async {
    currentUser = await getUserInfoUseCase.call();
    notifyListeners();
  }
}
