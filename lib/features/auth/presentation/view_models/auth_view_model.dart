import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:wasla/core/di/service_locator.dart';
import 'package:wasla/core/errors/failure.dart';
import 'package:wasla/features/auth/domain/use_cases/send_otp_use_case.dart';
import 'package:wasla/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:wasla/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:wasla/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:wasla/features/location/presentation/view_models/location_view_model.dart';

class AuthViewModel extends ChangeNotifier {
  String errorMessage = '';
  String otpCode = '';
  bool isLoading = false;
  bool isSignout = false;
  bool isVisiblePass = false;
  SignOutUseCase signOutUseCase;
  SignInUseCase signInUseCase;
  SignUpUseCase signUpUseCase;
  SendOtpUseCase sendOtpUseCase;

  AuthViewModel({
    required this.sendOtpUseCase,
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

  Future<Either<Failure, String>> sendOtp({required String email}) async {
    final result = await sendOtpUseCase.call(email: email);
    result.fold(
      (failure) {
        errorMessage = failure.message;
      },
      (otp) {
        otpCode = otp;
        errorMessage = '';
      },
    );
    notifyListeners();
    return result;
  }

  Future<void> signOut() async {
    isSignout = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2), () async {
      await signOutUseCase.call();
      isSignout = false;
    });

    notifyListeners();
  }

  void togglePasswordVisibility() {
    isVisiblePass = !isVisiblePass;
    notifyListeners();
  }

  void reset() {
    errorMessage = '';
    isLoading = false;
    sl<LocationViewModel>().reset();
    notifyListeners();
  }
}
