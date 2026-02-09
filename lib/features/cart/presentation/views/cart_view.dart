import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';
import 'package:wasla/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wasla/features/cart/presentation/widgets/cart_items_list.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('السلة', style: AppTextStyle.lightHeading1(layout)),
      ),
      body: Consumer<CartViewModel>(
        builder:
            (context, cartViewModel, child) => SafeArea(
              child:
                  cartViewModel.items.isEmpty
                      ? Center(
                        child: Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'السلة فارغة',
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
                      : Column(
                        children: [
                          CartItemsList(),
                          Container(
                            padding: EdgeInsets.all(layout.md),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(layout.rmd),
                                topRight: Radius.circular(layout.rmd),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "اجمالي المنتجات",
                                      style: AppTextStyle.lightBody(
                                        layout,
                                      ).copyWith(
                                        fontSize: layout.fontMedium * 1.2,
                                      ),
                                    ),
                                    Text(
                                      "${cartViewModel.totalAmount} شيكل",
                                      style: AppTextStyle.lightBody(
                                        layout,
                                      ).copyWith(
                                        fontSize: layout.fontMedium * 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: layout.sm),
                                Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "الإجمالي الكلي",
                                      style: AppTextStyle.lightBody(
                                        layout,
                                      ).copyWith(
                                        color: AppColors.lightPrimaryColor,
                                      ),
                                    ),
                                    Text(
                                      "${cartViewModel.totalAmount + 5} شيكل",
                                      style: AppTextStyle.lightSubtitle(
                                        layout,
                                      ).copyWith(
                                        color: AppColors.lightPrimaryColor,
                                        fontSize: layout.fontLarge,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: layout.xl),
                                CustomElevatedButtonWidget(
                                  onPressed: () {
                                    GoRouter.of(
                                      context,
                                    ).pushNamed(AppRouter.addressView);
                                  },
                                  title: 'تاكيد الطلب',
                                ),
                                SizedBox(height: layout.xl * 2.5),
                              ],
                            ),
                          ),
                        ],
                      ),
            ),
      ),
    );
  }
}
