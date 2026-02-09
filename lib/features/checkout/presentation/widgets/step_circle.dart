import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';

class StepCircle extends StatelessWidget {
  const StepCircle({super.key, required this.isCompleted, required this.title});
  final bool isCompleted;
  final String title;
  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted ? AppColors.lightPrimaryColor : Colors.white,
            border: Border.all(color: AppColors.lightPrimaryColor),
          ),
          child: Icon(
            isCompleted ? Icons.check : null,
            color: isCompleted ? Colors.white : AppColors.lightPrimaryColor,
          ),
        ),
        SizedBox(height: layout.xs),
        Text(title, style: AppTextStyle.lightSubtitle(layout)),
      ],
    );
  }
}
