import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';
import 'package:wasla/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:wasla/main.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({
    super.key,
    required this.layout,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
  }) : _passwordController = passwordController,
       _confirmPasswordController = confirmPasswordController;

  final AppLayout layout;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: layout.xl),
        child: Column(
          children: [
            const Spacer(flex: 2),
            Text(
              'من فضلك أنشئ كلمة مرور قوية لحماية حسابك',
              textAlign: TextAlign.center,
              style: AppTextStyle.lightBody(layout).copyWith(
                color: const Color(0xff7E7575),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: layout.xl),
            CustomTextField(
              controller: _passwordController,
              label: ' كلمة المرور',

              icon: Icons.lock_outline,
            ),
            CustomTextField(
              controller: _confirmPasswordController,
              label: 'تأكيد كلمة المرور',

              icon: Icons.lock_outline,
            ),
            SizedBox(height: layout.xl * 1.5),
            CustomElevatedButtonWidget(
              isFilled: true,
              onPressed: () {
                GoRouter.of(
                  context,
                ).pushNamed(AppRouter.passwordChangedSuccessView);
              },
              title: 'تحديث كلمة المرور',
            ),
            SizedBox(height: layout.lg),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pushNamed(AppRouter.signInView);
                  },

                  child: Text(
                    'تسجيل دخول',
                    style: AppTextStyle.lightBody(layout).copyWith(
                      color: AppColors.lightPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  ' تذكرت كلمة المرور ؟ ',
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
