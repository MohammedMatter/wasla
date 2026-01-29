import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';
import 'package:wasla/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:wasla/features/auth/presentation/widgets/auth_divider.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/social_auth_button.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<SignInBody> {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: layout.xl),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: layout.xl),
              Text(
                'أدخل بياناتك علشان تتابع أدويتك\nوتستمتع بخدماتنا بسهولة',
                textAlign: TextAlign.center,
                style: AppTextStyle.lightSubtitle(
                  layout,
                ).copyWith(fontSize: layout.fontMedium * 1.3),
              ),
              SizedBox(height: layout.xl * 1.5),
              CustomTextField(
                controller: email,
                label: 'البريد الالكتروني',
                icon: Icons.email_outlined,
              ),
              CustomTextField(
                controller: password,
                label: 'كلمة المرور',
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(
                      context,
                    ).pushNamed(AppRouter.forgotPasswordView);
                  },
                  child: Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyle(
                      color: AppColors.lightPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: layout.fontSmall * 1.2,
                    ),
                  ),
                ),
              ),

              SizedBox(height: layout.lg),

              Consumer<AuthViewModel>(
                builder:
                    (context, authViewModel, child) =>
                        CustomElevatedButtonWidget(
                          title: 'تسجيل دخول',
                          onPressed: () async {
                            await authViewModel.signIn(
                              email: email.text,
                              password: password.text,
                            );
                            if (authViewModel.errorMessage.isNotEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    authViewModel.errorMessage,
                                    style: AppTextStyle.lightBody(
                                      layout,
                                    ).copyWith(color: Colors.white),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
              ),

              SizedBox(height: layout.xl),
              BuildDivider(),
              SizedBox(height: layout.lg),
              SocialAuthButton(
                label: 'Google',
                iconPath: Icons.g_mobiledata,
                color: Colors.red,
              ),
              SizedBox(height: layout.md),
              SocialAuthButton(
                label: 'Facebook',
                iconPath: Icons.facebook,
                color: Colors.blue[800]!,
              ),

              SizedBox(height: layout.xl),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(
                        context,
                      ).pushReplacementNamed(AppRouter.signUpView);
                    },
                    child: const Text(
                      'انشاء حساب جديد',
                      style: TextStyle(
                        color: AppColors.lightPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(' ؟ ليس لديك حساب'),
                ],
              ),
              SizedBox(height: layout.lg),
            ],
          ),
          Consumer<AuthViewModel>(
            builder:
                (context, authViewModel, child) => Positioned.fill(
                  child:
                      authViewModel.isLoading
                          ? Center(
                            child: CircularProgressIndicator(
                              color: const Color.fromARGB(255, 23, 79, 82),
                            ),
                          )
                          : SizedBox.shrink(),
                ),
          ),
        ],
      ),
    );
  }
}
