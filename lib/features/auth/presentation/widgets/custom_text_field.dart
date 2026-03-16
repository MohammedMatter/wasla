import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/features/auth/domain/validation/signup_validation.dart';
import 'package:wasla/features/auth/presentation/view_models/auth_view_model.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextFieldType? textFieldType;
  bool isEnabled;
  TextEditingController? passwordController;
  TextInputType keyboardType;
  bool isPassword;
  String label;
  IconData? icon;
  TextEditingController controller;
  CustomTextField({
    super.key,
    this.textFieldType,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.isEnabled = true,
    this.icon,
    this.passwordController,
    this.keyboardType = TextInputType.name,
  });

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Consumer<AuthViewModel>(
        builder:
            (context, authViewModel, child) => TextFormField(
              validator: (value) {
                switch (textFieldType) {
                  case TextFieldType.name:
                    return SignUpValidation.nameErrorMessage(
                      result: SignUpValidation.nameValidation(name: value!),
                    );
                  case TextFieldType.email:
                    return SignUpValidation.emailErrorMessage(
                      result: SignUpValidation.emailValidation(email: value!),
                    );
                  case TextFieldType.password:
                    return SignUpValidation.passwordErrorMessage(
                      result: SignUpValidation.passwordValidation(
                        password: value!,
                      ),
                    );
                  case TextFieldType.confirmPassword:
                    return SignUpValidation.confirmPasswordErrorMessage(
                      result: SignUpValidation.confirmPasswordValidation(
                        confPass: value!,
                        pass: passwordController?.text,
                      ),
                    );
                  default:
                    TextFieldType.none;
                }
                return null;
              },
              enabled: isEnabled,
              controller: controller,
              obscureText: isPassword && !authViewModel.isVisiblePass,
              decoration: InputDecoration(
                hintText: label,
                hintStyle: TextStyle(color: Colors.grey[600]),
                labelStyle: TextStyle(color: AppColors.lightPrimaryColor),
                prefixIcon:
                    icon != null ? Icon(icon, color: Colors.grey) : null,
                suffixIcon:
                    isPassword
                        ? InkWell(
                          onTap: () {
                            authViewModel.togglePasswordVisibility();
                          },
                          child:
                              authViewModel.isVisiblePass
                                  ? Icon(
                                    Icons.visibility_outlined,
                                    color: Colors.grey,
                                  )
                                  : Icon(
                                    Icons.visibility_off_outlined,
                                    color: Colors.grey,
                                  ),
                        )
                        : null,
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: layout.md,
                  vertical: layout.sm,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(layout.rsm),
                  borderSide: BorderSide(
                    color: AppColors.lightPrimaryColor.withOpacity(0.35),
                    width: 1.3,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(layout.rmd * 1.5),
                  borderSide: BorderSide(
                    color: AppColors.lightPrimaryColor,
                    width: 1.3,
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
