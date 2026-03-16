import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.xl),
          child: Column(
            children: [
              const Spacer(flex: 1),
              Expanded(
                flex: 3,
                child: Center(
                  child: Image.asset(
                    'assets/images/welcome.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    'أهلاً بك ...صحتك دايماً في أمان معنا',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.lightBody(layout).copyWith(
                      color: AppColors.lightPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: layout.fontMedium,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButtonWidget(
                      onPressed: () {
                        GoRouter.of(context).pushNamed(AppRouter.signInView);
                      },
                      title: 'تسجيل الدخول',
                    ),
                  ),

                  SizedBox(height: layout.sm),
                  CustomElevatedButtonWidget(
                    isFilled: false,
                    onPressed: () {
                      GoRouter.of(context).pushNamed(AppRouter.signUpView);
                    },
                    title: 'انشاء حساب جديد',
                  ),
                ],
              ),

              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
