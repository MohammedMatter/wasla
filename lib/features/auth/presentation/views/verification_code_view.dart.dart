import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/constants/lang_keys.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/auth/presentation/widgets/verification_code_body.dart';

class VerificationCodeView extends StatelessWidget {
  final String otpCode;
  const VerificationCodeView({super.key, required this.otpCode});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          LangKeys.verifyTitle.tr(),
          style: AppTextStyle.lightHeading1(layout),
        ),
        actions: [
          IconButton(
            icon: Icon(
              context.locale.languageCode == 'ar'
                  ? Icons.arrow_circle_right_outlined
                  : Icons.arrow_circle_left_outlined,
              size: layout.fontXLarge,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: const VerificationCodeBody(),
    );
  }
}
