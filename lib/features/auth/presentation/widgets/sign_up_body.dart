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
import 'package:wasla/features/auth/domain/validation/signup_validation.dart';
import 'package:wasla/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:wasla/features/auth/presentation/widgets/auth_divider.dart';
import 'package:wasla/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:wasla/features/auth/presentation/widgets/social_auth_button.dart';
import 'package:wasla/features/profile/presentation/view_models/profile_view_model.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Form(
      key: _key,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: layout.md),
        child: Consumer<AuthViewModel>(
          builder:
              (context, authViewModel, child) => Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: layout.xl),
                      Text(
                        LangKeys.registerSubtitle.tr(),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.lightSubtitle(
                          layout,
                        ).copyWith(fontSize: layout.fontMedium),
                      ),
                      SizedBox(height: layout.xl),
                      CustomTextField(
                        isEnabled: !authViewModel.isLoading,
                        label: LangKeys.nameLabel.tr(),
                        icon: Icons.person_outline,
                        controller: name,
                        textFieldType: TextFieldType.name,
                      ),
                      SizedBox(height: layout.sm),
                      CustomTextField(
                        isEnabled: !authViewModel.isLoading,
                        controller: email,
                        label: LangKeys.emailLabel.tr(),
                        icon: Icons.email_outlined,
                        textFieldType: TextFieldType.email,
                      ),
                      SizedBox(height: layout.sm),
                      CustomTextField(
                        isEnabled: !authViewModel.isLoading,
                        controller: password,
                        isPassword: true,
                        label: LangKeys.passwordLabel.tr(),
                        icon: Icons.lock_outline,
                        textFieldType: TextFieldType.password,
                      ),
                      SizedBox(height: layout.sm),
                      CustomTextField(
                        isEnabled: !authViewModel.isLoading,
                        controller: confirmPassword,
                        isPassword: true,
                        label: LangKeys.confirmPasswordLabel.tr(),
                        icon: Icons.lock_outline,
                        passwordController: password,
                        textFieldType: TextFieldType.confirmPassword,
                      ),
                      SizedBox(height: layout.xl),
                      Consumer2<AuthViewModel, ProfileViewModel>(
                        builder:
                            (
                              context,
                              authViewModel,
                              profileViewModel,
                              child,
                            ) => CustomElevatedButtonWidget(
                              title: LangKeys.registerButton.tr(),
                              onPressed:
                                  authViewModel.isLoading
                                      ? () => null
                                      : () async {
                                        if (_key.currentState!.validate()) {
                                          await authViewModel.signUp(
                                            email: email.text,
                                            password: password.text,
                                            name: name.text,
                                          );

                                          if (authViewModel
                                              .errorMessage
                                              .isEmpty) {
                                            await profileViewModel
                                                .getUserInfo();
                                            if (context.mounted) {
                                              GoRouter.of(
                                                context,
                                              ).pushReplacementNamed(
                                                AppRouter.registerSuccessView,
                                              );
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                                  SnackBar(
                                                    backgroundColor: Colors.red,
                                                    content: Text(
                                                      authViewModel
                                                          .errorMessage,
                                                      style:
                                                          AppTextStyle.lightBody(
                                                            layout,
                                                          ).copyWith(
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                  ),
                                                )
                                                .closed
                                                .then(
                                                  (value) =>
                                                      authViewModel.reset(),
                                                );
                                          }
                                        }
                                      },
                            ),
                      ),
                      SizedBox(height: layout.xl),
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
                      SizedBox(height: layout.md),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(' ${LangKeys.haveAccount.tr()}'),
                          SizedBox(height: layout.sm * 0.6),
                          GestureDetector(
                            onTap: () {
                              GoRouter.of(
                                context,
                              ).pushReplacementNamed(AppRouter.signInView);
                            },
                            child: Text(
                              LangKeys.loginLink.tr(),
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
      ),
    );
  }
}
