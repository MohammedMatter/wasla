import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';

class ActionDetailButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final bool isBordered;
  final Function() onTap;
  const ActionDetailButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
    required this.textColor,
    this.isBordered = false,
  });

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return InkWell(
      overlayColor: WidgetStatePropertyAll(
        AppColors.lightPrimaryColor.withOpacity(0.3),
      ),
      borderRadius: BorderRadius.circular(layout.rmd * 1.3),
      onTap: () => onTap(),
      child: Ink(
        padding: EdgeInsets.symmetric(vertical: layout.sm),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(layout.rmd * 1.3),
          border: Border.all(
            color: isBordered ? Color(0xffAAAAAA) : Colors.transparent,
            width: 1.45,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyle.lightHeading2(
              layout,
            ).copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
