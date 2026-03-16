import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/auth/presentation/widgets/reset_password_body.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'انشاء كلمة مرور جديدة ',
          style: AppTextStyle.lightHeading1(layout).copyWith(
            fontSize: layout.fontLarge.clamp(18.0, 24.0),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ResetPasswordBody(
        layout: layout,
        passwordController: _passwordController,
        confirmPasswordController: _confirmPasswordController,
      ),
    );
  }
}
