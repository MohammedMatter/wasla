import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:wasla/core/errors/failure.dart';
import 'package:wasla/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:wasla/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:wasla/features/auth/domain/use_cases/sign_up_use_case.dart';

class AuthViewModel extends ChangeNotifier {
  String errorMessage = '';
  bool isLoading = false;
  SignOutUseCase signOutUseCase;
  SignInUseCase signInUseCase;
  SignUpUseCase signUpUseCase;

  AuthViewModel({
    required this.signInUseCase,
    required this.signOutUseCase,
    required this.signUpUseCase,
  });

  Future<Either<Failure, Unit>> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    final result = await signUpUseCase.call(
      email: email,
      password: password,
      name: name,
    );
    result.fold(
      (failure) {
        errorMessage = failure.message;
      },
      (_) {
        errorMessage = '';
      },
    );
    isLoading = false;
    notifyListeners();
    return result;
  }

  Future<Either<Failure, Unit>> signIn({
    required String email,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    final result = await signInUseCase.call(email: email, password: password);
    result.fold(
      (failure) {
        errorMessage = failure.message;
      },
      (_) {
        errorMessage = '';
      },
    );
    isLoading = false;
    notifyListeners();
    return result;
  }

  void reset() {
    errorMessage = '';
    isLoading = false;
    notifyListeners();
  }
}
