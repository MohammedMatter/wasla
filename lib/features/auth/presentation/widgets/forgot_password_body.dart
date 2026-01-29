import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';
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
            Spacer(flex: 1),
            Text(
              'أدخل بريدك الإلكتروني وهنبعتلك كود\n لإعادة تعيين كلمة المرور',
              textAlign: TextAlign.center,
              style: AppTextStyle.lightBody(
                layout,
              ).copyWith(color: Color(0xff7E7575)),
            ),

            SizedBox(height: layout.xl),
            Directionality(
              textDirection: TextDirection.rtl,
              child: CustomTextField(
                label: 'البريد الالكتروني',
                icon: Icons.email_outlined,
                controller: email,
              ),
            ),

            SizedBox(height: layout.xl),
            CustomElevatedButtonWidget(
              onPressed: () {
                GoRouter.of(context).pushNamed(AppRouter.verificationCodeView);
              },
              title: 'ارسال الكود',
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
                  ).copyWith(color: Color(0xff7E7575)),
                ),
              ],
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
