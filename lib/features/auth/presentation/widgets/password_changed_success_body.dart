import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/theme/design_tokens.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';

class PasswordChangedSuccessBody extends StatelessWidget {
  const PasswordChangedSuccessBody({super.key, required this.layout});

  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: layout.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            Container(
              padding: EdgeInsets.all(layout.lg),
              decoration: BoxDecoration(
                color: const Color(0xffE8F5E9),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.check_circle,
                  size: AppFontSize.fontLarge * 3,
                  color: const Color(0xff81C784),
                ),
              ),
            ),

            SizedBox(height: layout.xl),
            Text(
              'تم تغيير كلمة المرور بنجاح',
              textAlign: TextAlign.center,
              style: AppTextStyle.lightHeading1(
                layout,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: layout.md),
            Text(
              'يمكنك الآن تسجيل الدخول باستخدام\n كلمة المرور الجديدة الخاصة بك',
              textAlign: TextAlign.center,
              style: AppTextStyle.lightSubtitle(layout),
            ),
            SizedBox(height: layout.xl),
            CustomElevatedButtonWidget(
              isFilled: true,
              onPressed: () {
                GoRouter.of(context).pushNamed(AppRouter.signInView);
              },
              title: 'تسجيل الدخول',
            ),
            const Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
