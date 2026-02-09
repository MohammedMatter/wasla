import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/auth/presentation/widgets/forgot_password_body.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late TextEditingController email;

  @override
  void initState() {
    super.initState();

    email = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'إعادة تعيين كلمة المرور ',
          style: AppTextStyle.lightHeading1(layout),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_circle_right_outlined),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
        ],
      ),
      body: ForgotPasswordBody(layout: layout, email: email),
    );
  }
}
