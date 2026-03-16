import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';
import 'package:wasla/features/auth/domain/validation/signup_validation.dart';
import 'package:wasla/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:wasla/features/auth/presentation/view_models/vervication_view_model.dart';
import 'package:wasla/features/auth/presentation/widgets/custom_text_field.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({
    super.key,
    required this.layout,
    required this.email,
  });

  final AppLayout layout;
  final TextEditingController email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: layout.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            Text(
              'أدخل بريدك الإلكتروني وهنبعتلك كود\n لإعادة تعيين كلمة المرور',
              textAlign: TextAlign.center,
              style: AppTextStyle.lightBody(layout).copyWith(
                color: const Color(0xff7E7575),
                fontSize: layout.fontMedium,
              ),
            ),
            SizedBox(height: layout.xl),
            Directionality(
              textDirection: TextDirection.rtl,
              child: CustomTextField(
                label: 'البريد الالكتروني',
                icon: Icons.email_outlined,
                controller: email,
                textFieldType: TextFieldType.email,
              ),
            ),
            SizedBox(height: layout.xl),
            Consumer2<AuthViewModel, VervicationViewModel>(
              builder:
                  (context, authViewModel, vervicationViewModel, child) =>
                      CustomElevatedButtonWidget(
                        onPressed: () async {
                          if (email.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'يجب ادخال البريد الالكتروني اولا ',
                                  style: AppTextStyle.lightBody(
                                    layout,
                                  ).copyWith(color: Colors.white),
                                ),
                              ),
                            );
                            return;
                          }
                          showDialog(
                            context: context,
                            builder:
                                (context) => Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.lightPrimaryColor,
                                  ),
                                ),
                          );
                          vervicationViewModel.setUserEmail(email.text);
                          await Future.delayed(Duration(seconds: 1));
                          await authViewModel.sendOtp(email: email.text);
                          log(authViewModel.otpCode);
                          Navigator.pop(context);
                          if (authViewModel.errorMessage.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'تم ارسال الكود بنجاح',
                                  style: AppTextStyle.lightBody(
                                    layout,
                                  ).copyWith(color: AppColors.lightGrey),
                                ),
                              ),
                            );
                            GoRouter.of(context).pushNamed(
                              AppRouter.verificationCodeView,
                              extra: authViewModel.otpCode,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  authViewModel.errorMessage,
                                  style: AppTextStyle.lightBody(
                                    layout,
                                  ).copyWith(color: AppColors.lightGrey),
                                ),
                              ),
                            );
                          }
                        },
                        title: 'ارسال الكود',
                      ),
            ),
            SizedBox(height: layout.xl),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    ' تسجيل الدخول ',
                    style: AppTextStyle.lightBody(
                      layout,
                    ).copyWith(color: AppColors.lightPrimaryColor),
                  ),
                ),
                Text(
                  'تذكرت كلمة المرور ؟',
                  style: AppTextStyle.lightBody(
                    layout,
                  ).copyWith(color: const Color(0xff7E7575)),
                ),
              ],
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
