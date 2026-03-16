import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';

class MenuItem extends StatelessWidget {
  MenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  String title;
  IconData icon;
  Color iconColor;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.read<AppLayout>();
    return ListTile(
      onTap: () => onTap(),
      contentPadding: EdgeInsets.symmetric(vertical: layout.xs),
      title: Text(
        title,
        style: AppTextStyle.lightBody(
          layout,
        ).copyWith(color: Colors.grey[700], fontWeight: FontWeight.w500),
      ),
      leading: Icon(icon, color: iconColor, size: layout.fontLarge),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColors.lightPrimaryColor,
      ),
    );
  }
}
