import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/constants/lang_keys.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wasla/features/cart/presentation/widgets/cart_items_list.dart';
import 'package:wasla/features/cart/presentation/widgets/cart_summery_sheet.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    AppLayout layout = AppLayout();
    return Consumer<CartViewModel>(
      builder:
          (context, cartViewModel, child) => SafeArea(
            child:
                cartViewModel.items.isEmpty
                    ? Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LangKeys.cartEmpty.tr(),
                            style: AppTextStyle.lightHeading1(
                              layout,
                            ).copyWith(color: AppColors.lightPrimaryColor),
                          ),
                          SizedBox(width: layout.md),
                          Icon(
                            Icons.delete_outline,
                            color: AppColors.lightPrimaryColor,
                          ),
                        ],
                      ),
                    )
                    : Column(children: [CartItemsList(), CartSummerySheet()]),
          ),
    );
  }
}
