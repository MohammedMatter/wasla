import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/constants/lang_keys.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
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
          LangKeys.resetPasswordTitle.tr(),
          style: AppTextStyle.lightHeading1(layout).copyWith(
            fontSize: layout.fontLarge.clamp(18.0, 24.0),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            context.locale.languageCode == Locale('ar').languageCode
                ? Icons.arrow_circle_right_outlined
                : Icons.arrow_circle_left_outlined,

            color: AppColors.lightPrimaryColor,

            size: layout.fontXLarge.clamp(24.0, 32.0),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ForgotPasswordBody(layout: layout, email: email),
    );
  }
}
