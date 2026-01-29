import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';

class SocialAuthButton extends StatelessWidget {
  final String label;
  final Color color;
  final IconData iconPath;
  const SocialAuthButton({
    super.key,
    required this.color,
    required this.iconPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Container(
      width: double.infinity,
      height: layout.xl * 1.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(layout.rlg),
        border: Border.all(color: AppColors.lightGrey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: AppTextStyle.lightBody(
              layout,
            ).copyWith(fontSize: layout.fontLarge),
          ),
          SizedBox(width: layout.sm),
          Icon(iconPath, color: color, size: layout.fontXLarge),
        ],
      ),
    );
    ;
  }
}
