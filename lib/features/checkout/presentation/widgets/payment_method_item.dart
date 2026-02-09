import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasla/core/constants/app_assest.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/utils/screen_size.dart';

class PaymentMethodItem extends StatelessWidget {
  PaymentMethodItem({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.layout,
    required this.title,
    required this.imagePath,
  });

  final AppLayout layout;
  String title;
  String imagePath;
  final bool isSelected; // حالة العنصر
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: layout.sm),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(layout.rmd),
          border: Border.all(
            color: AppColors.lightPrimaryColor.withOpacity(0.8),
            width: 1.3,
          ),
        ),
        height: ScreenSize.h(context) * 0.065,
        width: double.infinity,
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            SizedBox(width: layout.sm),
            SizedBox(
              width: ScreenSize.w(context) * 0.15,
              height: ScreenSize.h(context) * 0.05,
              child: Image.asset(imagePath, fit: BoxFit.fill),
            ),
            SizedBox(width: layout.sm),
            Text(title, style: AppTextStyle.lightBody(layout)),
            Spacer(),
            isSelected
                ? FractionallySizedBox(
                  heightFactor: 0.5,
                  child: CircleAvatar(
                    backgroundColor: AppColors.lightPrimaryColor,
                    child: Icon(Icons.check, color: Colors.white),
                  ),
                )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
