import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wasla/core/constants/lang_keys.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';

class BuildDivider extends StatelessWidget {
  const BuildDivider({super.key});

  @override
  Widget build(BuildContext context) {
    AppLayout layout = AppLayout();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.md),
      child: Row(
        children: [
          Expanded(
            child: Divider(thickness: 2.5, color: AppColors.lightPrimaryColor),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: layout.lg),
            child: Text(
              LangKeys.loginWith.tr(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(thickness: 2.5, color: AppColors.lightPrimaryColor),
          ),
        ],
      ),
    );
  }
}
