import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/constants/lang_keys.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';
import 'package:wasla/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:easy_localization/easy_localization.dart';

class CartSummerySheet extends StatelessWidget {
  const CartSummerySheet({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();

    return Consumer<CartViewModel>(
      builder:
          (context, cartViewModel, child) => Container(
            padding: EdgeInsets.fromLTRB(
              layout.md,
              layout.sm,
              layout.md,
              layout.lg,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(layout.rmd),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: layout.xl,
                  height: 4,
                  margin: EdgeInsets.only(bottom: layout.md),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(layout.rsm),
                  ),
                ),
                _buildPriceRow(
                  label: LangKeys.cartTotalProducts.tr(),
                  value:
                      "${cartViewModel.totalAmount} ${context.locale.languageCode == Locale('ar').languageCode ? 'شيكل' : 'NIS'}",
                  layout: layout,
                ),
                SizedBox(height: layout.xs),
                _buildPriceRow(
                  label: LangKeys.cartDeliveryFees.tr(),
                  value:
                      "5 ${context.locale.languageCode == Locale('ar').languageCode ? 'شيكل' : 'NIS'}",
                  layout: layout,
                  color: Colors.grey[600],
                ),
                Divider(height: layout.lg, thickness: 0.5),
                _buildPriceRow(
                  label: LangKeys.cartTotalAmount.tr(),
                  value:
                      "${cartViewModel.totalAmount + 5} ${context.locale.languageCode == Locale('ar').languageCode ? 'شيكل' : 'NIS'}",
                  layout: layout,
                  isBold: true,
                  color: AppColors.lightPrimaryColor,
                  fontSize: layout.fontMedium,
                ),
                SizedBox(height: layout.md),
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButtonWidget(
                    onPressed: () {
                      context.pushNamed(AppRouter.addressView);
                    },
                    title: LangKeys.cartConfirmOrder.tr(),
                  ),
                ),
                SizedBox(height: layout.sm),
              ],
            ),
          ),
    );
  }

  Widget _buildPriceRow({
    required String label,
    required String value,
    required AppLayout layout,
    bool isBold = false,
    Color? color,
    double? fontSize,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyle.lightBody(layout).copyWith(
            color: color ?? Colors.black,
            fontSize: fontSize ?? layout.fontSmall,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: AppTextStyle.lightBody(layout).copyWith(
            color: color ?? Colors.black,
            fontSize: fontSize ?? layout.fontSmall,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
