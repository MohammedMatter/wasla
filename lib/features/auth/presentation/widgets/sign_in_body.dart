import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/constants/app_assest.dart';
import 'package:wasla/core/constants/lang_keys.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';
import 'package:wasla/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:wasla/features/auth/presentation/widgets/auth_divider.dart';
import 'package:wasla/features/profile/presentation/view_models/profile_view_model.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/social_auth_button.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<SignInBody> {
  late TextEditingController email;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: layout.md),
      child: Consumer<AuthViewModel>(
        builder:
            (context, authViewModel, child) => Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: layout.xl),
                    Text(
                      LangKeys.loginSubtitle.tr(),
                      textAlign: TextAlign.center,
                      style: AppTextStyle.lightSubtitle(
                        layout,
                      ).copyWith(fontSize: layout.fontMedium),
                    ),
                    SizedBox(height: layout.xl),
                    CustomTextField(
                      isEnabled: !authViewModel.isLoading,
                      controller: email,
                      label: LangKeys.emailLabel.tr(),
                      icon: Icons.email_outlined,
                    ),
                    SizedBox(height: layout.sm),
                    CustomTextField(
                      isEnabled: !authViewModel.isLoading,
                      controller: password,
                      label: LangKeys.passwordLabel.tr(),
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
                          LangKeys.forgotPassword.tr(),
                          style: TextStyle(
                            color: AppColors.lightPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: layout.fontSmall,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: layout.sm),
                    Consumer2<AuthViewModel, ProfileViewModel>(
                      builder:
                          (context, authViewModel, profileViewModel, child) =>
                              CustomElevatedButtonWidget(
                                title: LangKeys.loginButton.tr(),
                                onPressed: () async {
                                  await authViewModel.signIn(
                                    email: email.text,
                                    password: password.text,
                                  );

                                  if (authViewModel.errorMessage.isNotEmpty) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                              authViewModel.errorMessage,
                                              style: AppTextStyle.lightBody(
                                                layout,
                                              ).copyWith(color: Colors.white),
                                            ),
                                          ),
                                        )
                                        .closed
                                        .then((value) {
                                          authViewModel.reset();
                                        });
                                  } else {
                                    await profileViewModel.getUserInfo();
                                    if (context.mounted) {
                                      GoRouter.of(
                                        context,
                                      ).goNamed(AppRouter.homeView);
                                    }
                                  }
                                },
                              ),
                    ),
                    SizedBox(height: layout.lg),
                    const BuildDivider(),
                    SizedBox(height: layout.lg),
                    SocialAuthButton(
                      label: LangKeys.googleLogin.tr(),
                      icon: SvgPicture.string(
                        AppAssest.google,
                        height: layout.fontXLarge * 1.3,
                      ),
                      color: Colors.red,
                    ),
                    SizedBox(height: layout.md),
                    SocialAuthButton(
                      label: LangKeys.facebookLogin.tr(),
                      icon: Padding(
                        padding: EdgeInsets.only(left: layout.md),
                        child: Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: layout.fontXLarge,
                        ),
                      ),
                      color: Colors.blue[800]!,
                    ),
                    SizedBox(height: layout.xl),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(' ${LangKeys.dontHaveAccount.tr()}'),
                        SizedBox(width: layout.sm * 0.4),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).pushReplacementNamed(AppRouter.signUpView);
                          },
                          child: Text(
                            LangKeys.registerLink.tr(),
                            style: const TextStyle(
                              color: AppColors.lightPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                if (authViewModel.isLoading)
                  Positioned.fill(
                    top: layout.lg * 5,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.lightPrimaryColor,
                        backgroundColor: AppColors.lightPrimaryColor
                            .withOpacity(0.1),
                      ),
                    ),
                  ),
              ],
            ),
      ),
    );
  }
}
