import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/auth/presentation/widgets/sign_in_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تسجيل الدخول',
          style: AppTextStyle.lightHeading1(layout).copyWith(
            fontSize: layout.fontLarge.clamp(18.0, 24.0),
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SignInBody(),
    );
  }
}
