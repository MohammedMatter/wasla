import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';

class BuildDivider extends StatelessWidget {
  const BuildDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.xl),
      child: Row(
        children: [
          Expanded(
            child: Divider(thickness: 2.5, color: AppColors.lightPrimaryColor),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: layout.lg),
            child: Text(
              'سجل باستخدام',
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
