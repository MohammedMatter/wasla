import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wasla/core/constants/lang_keys.dart';
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
              decoration: const BoxDecoration(
                color: Color(0xffE8F5E9),
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
              LangKeys.successTitle.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyle.lightHeading1(
                layout,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: layout.md),
            Text(
              LangKeys.successSubtitle.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyle.lightSubtitle(layout),
            ),
            SizedBox(height: layout.xl),
            CustomElevatedButtonWidget(
              isFilled: true,
              onPressed: () {
                GoRouter.of(context).pushNamed(AppRouter.signInView);
              },
              title: LangKeys.backToLogin.tr(),
            ),
            const Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
