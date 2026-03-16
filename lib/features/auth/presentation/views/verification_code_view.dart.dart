import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/auth/presentation/widgets/verification_code_body.dart';

// ignore: must_be_immutable
class VerificationCodeView extends StatelessWidget {
  String otpCode;
  VerificationCodeView({super.key, required this.otpCode});

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
            icon: Icon(
              Icons.arrow_circle_right_outlined,
              size: layout.fontXLarge,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: VerificationCodeBody(),
    );
  }
}
