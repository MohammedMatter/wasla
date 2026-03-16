// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/utils/screen_size.dart';
import 'package:wasla/features/checkout/presentation/view_models/payment_view_model.dart';

// ignore: must_be_immutable
class PaymentMethodViaBankOfPalestine extends StatelessWidget {
  bool isSelected = false;
  VoidCallback onTap;
  String title;
  PaymentMethodViaBankOfPalestine({
    super.key,
    required this.onTap,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: layout.sm),
        decoration: BoxDecoration(
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
            SizedBox(width: layout.md),
            Text(title, style: AppTextStyle.lightBody(layout)),
            Spacer(),
            Consumer<PaymentViewModel>(
              builder:
                  (context, paymentViewModel, child) => FractionallySizedBox(
                    heightFactor: 0.5,
                    child:
                        isSelected
                            ? CircleAvatar(
                              backgroundColor: AppColors.lightPrimaryColor,
                              child: Icon(Icons.check, color: Colors.white),
                            )
                            : SizedBox.shrink(),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
