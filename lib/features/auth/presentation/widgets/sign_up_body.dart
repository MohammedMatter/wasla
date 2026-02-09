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
import 'package:wasla/features/auth/presentation/widgets/auth_divider.dart';
import 'package:wasla/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:wasla/features/auth/presentation/widgets/social_auth_button.dart';

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

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Form(
      key: _key,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: layout.xl),
        child: Consumer<AuthViewModel>(
          builder:
              (context, authViewModel, child) => Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: layout.xl),
                      Text(
                        'ابدأ رحلتك مع تطبيقنا وسجل بياناتك\nعشان تتابع أدويتك وتطلبها بسهولة',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.lightSubtitle(
                          layout,
                        ).copyWith(fontSize: layout.fontMedium * 1.3),
                      ),
                      SizedBox(height: layout.xl),
                      CustomTextField(
                        isEnabled: authViewModel.isLoading ? false : true,
                        label: 'الاسم',
                        icon: Icons.person_outline,
                        controller: name,
                        textFieldType: TextFieldType.name,
                      ),
                      CustomTextField(
                        isEnabled: authViewModel.isLoading ? false : true,
                        controller: email,
                        label: 'البريد الالكتروني',
                        icon: Icons.email_outlined,
                        textFieldType: TextFieldType.email,
                      ),
                      CustomTextField(
                        isEnabled: authViewModel.isLoading ? false : true,
                        controller: password,
                        isPassword: true,
                        label: 'كلمة المرور',
                        icon: Icons.lock_outline,
                        textFieldType: TextFieldType.password,
                      ),
                      CustomTextField(
                        isEnabled: authViewModel.isLoading ? false : true,
                        controller: confirmPassword,
                        isPassword: true,
                        label: 'تأكيد كلمة المرور',
                        icon: Icons.lock_outline,
                        passwordController: password,
                        textFieldType: TextFieldType.confirmPassword,
                      ),
                      SizedBox(height: layout.xl * 1.3),

                      Consumer<AuthViewModel>(
                        builder:
                            (context, authViewModel, child) =>
                                CustomElevatedButtonWidget(
                                  title: 'انشاء حساب جديد',
                                  onPressed: () async {
                                    if (_key.currentState!.validate()) {
                                      await authViewModel.signUp(
                                        email: email.text,
                                        password: password.text,
                                        name: name.text,
                                      );
                                      GoRouter.of(context).pushReplacementNamed(
                                        AppRouter.registerSuccessView,
                                      );
                                    }

                                    if (authViewModel.errorMessage.isNotEmpty) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
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
                        color: Colors.red,
                        iconPath: Icons.g_mobiledata,
                        label: 'Google',
                      ),

                      SizedBox(height: layout.md),
                      SocialAuthButton(
                        label: 'Facebook',
                        iconPath: Icons.facebook,
                        color: Colors.blue[800]!,
                      ),
                      SizedBox(height: layout.md),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              GoRouter.of(
                                context,
                              ).pushReplacementNamed(AppRouter.signInView);
                            },
                            child: const Text(
                              'تسجيل دخول',
                              style: TextStyle(
                                color: AppColors.lightPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Text(' ؟ لديك حساب بالفعل'),
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
                                      color: const Color.fromARGB(
                                        255,
                                        23,
                                        79,
                                        82,
                                      ),
                                    ),
                                  )
                                  : SizedBox.shrink(),
                        ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
