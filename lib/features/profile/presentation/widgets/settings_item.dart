import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';

class SettingsItem extends StatelessWidget {
  SettingsItem({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
    this.trailing,
  });

  VoidCallback? onTap;
  IconData icon;
  String title;
  Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Card(
      color: AppColors.lightPrimaryColor.withOpacity(0.05),
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[200]!),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: AppColors.lightPrimaryColor),
        title: Text(title, style: AppTextStyle.lightBody(layout)),
        trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
