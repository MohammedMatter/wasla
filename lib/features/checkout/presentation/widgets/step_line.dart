import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';

class StepLine extends StatelessWidget {
  const StepLine({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Container(
      width: 60,
      height: 1.5,
      margin: const EdgeInsets.only(bottom: 20),
      color: AppColors.lightPrimaryColor.withOpacity(0.5),
    );
  }
}
