import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';

// ignore: must_be_immutable
class CustomElevatedButtonWidget extends StatelessWidget {
  String title;
  bool isFilled;
  Function()? onPressed;
  CustomElevatedButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.isFilled = true,
  });

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(layout.sm * 1.3),
          disabledBackgroundColor: Colors.white,
          backgroundColor:
              isFilled
                  ? AppColors.lightPrimaryColor
                  : AppColors.lightBackgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color:
                  !isFilled ? AppColors.lightPrimaryColor : Colors.transparent,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(layout.rmd),
          ),
        ),
        child: Text(
          title,
          style: AppTextStyle.lightBody(layout).copyWith(
            fontSize: layout.fontMedium,
            fontWeight: FontWeight.bold,
            color: isFilled ? Colors.white : AppColors.lightPrimaryColor,
          ),
        ),
      ),
    );
  }
}
