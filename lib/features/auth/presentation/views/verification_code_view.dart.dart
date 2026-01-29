import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/auth/presentation/widgets/verification_code_body.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'ادخل رمز التحقق',
          style: AppTextStyle.lightHeading1(layout),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_circle_right_outlined),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: VerificationCodeBody(),
    );
  }
}
