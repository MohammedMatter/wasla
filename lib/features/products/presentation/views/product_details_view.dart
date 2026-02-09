import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';
import 'package:wasla/features/products/presentation/widgets/action_detail_button.dart';
import 'package:wasla/features/products/presentation/widgets/header_product_detail.dart';
import 'package:wasla/features/products/presentation/widgets/related_product_card.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('تفاصيل المنتج', style: AppTextStyle.lightHeading1(layout)),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_circle_right_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: layout.md),
          child: Stack(
            children: [
              Column(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: layout.md),
                  HeaderProductDetail(),
                  SizedBox(height: layout.lg),
                  _productActionRow(layout, context),
                  SizedBox(height: layout.lg),
                  RelatedProductCard(),
                  SizedBox(height: layout.md),
                ],
              ),
              Consumer<CartViewModel>(
                builder:
                    (context, cartViewModel, child) =>
                        cartViewModel.isLoading
                            ? Positioned.fill(
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.lightPrimaryColor,
                                ),
                              ),
                            )
                            : SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productActionRow(AppLayout layout, BuildContext context) {
    return Consumer2<CartViewModel, ProductViewModel>(
      builder:
          (context, cartViewModel, productViewModel, child) => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: layout.lg,
              vertical: layout.md,
            ),
            child: Row(
              children: [
                Expanded(
                  child: ActionDetailButton(
                    onTap: () async {
                      await cartViewModel.addToCart(
                        productViewModel.selectedProduct!,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            'تمت اضافة المنتج الى السلة بنجاح',
                            style: AppTextStyle.lightBody(
                              layout,
                            ).copyWith(color: Colors.white),
                          ),
                        ),
                      );

                      null;
                    },
                    text: 'أضف إلى السلة',
                    color: AppColors.lightPrimaryColor,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(width: layout.xl),
                Expanded(
                  child: ActionDetailButton(
                    onTap: () {
                      GoRouter.of(context).pushNamed(AppRouter.addressView);
                    },
                    text: 'اشتر الآن',
                    color: Colors.white,
                    textColor: AppColors.lightPrimaryColor,
                    isBordered: true,
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
