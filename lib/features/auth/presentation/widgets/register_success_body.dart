import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wasla/core/constants/lang_keys.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';

class RegisterSuccessBody extends StatelessWidget {
  const RegisterSuccessBody({super.key, required this.layout});

  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: layout.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            Image.asset('assets/images/success_register.png'),
            SizedBox(height: layout.lg),
            Text(
              LangKeys.successTitle.tr(),
              style: AppTextStyle.lightHeading1(layout),
            ),
            SizedBox(height: layout.md),
            Text(
              LangKeys.successSubtitle.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyle.lightSubtitle(
                layout,
              ).copyWith(fontSize: layout.fontMedium),
            ),
            SizedBox(height: layout.xl),
            CustomElevatedButtonWidget(
              onPressed: () {
                GoRouter.of(context).pushNamed(AppRouter.homeView);
              },
              title: LangKeys.onboardingStart.tr(),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
