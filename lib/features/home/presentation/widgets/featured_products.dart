import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/home/presentation/view_models/home_view_model.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';
import 'package:wasla/features/products/presentation/widgets/product_item.dart';

class FeaturedProducts extends StatelessWidget {
  const FeaturedProducts({super.key, required this.layout});

  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.rtl,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    'المنتجات المميزة ',
                    style: AppTextStyle.lightHeading2(
                      layout,
                    ).copyWith(fontSize: layout.fontMedium * 1.5),
                  ),
                  Consumer<HomeViewModel>(
                    builder:
                        (context, homeViewModel, child) => Padding(
                          padding: EdgeInsets.only(left: layout.lg),
                          child: TextButton(
                            child: Text(
                              homeViewModel.showAllFeaturedProducts
                                  ? 'عرض اقل'
                                  : 'عرض المزيد',
                              style:
                                  AppTextStyle.lightSubtitle(layout).copyWith(),
                            ),
                            onPressed: () {
                              homeViewModel.toogleShowAllFeaturedProducts();
                            },
                          ),
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Consumer2<HomeViewModel, ProductViewModel>(
          builder:
              (context, homeViewModel, productViewModel, child) => AnimatedSize(
                curve: Curves.decelerate,
                duration: Duration(milliseconds: 680),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:
                      homeViewModel.showAllFeaturedProducts
                          ? productViewModel.topRatedProducts.length
                          : 2,
                  itemBuilder:
                      (context, index) => ProductItem(
                        layout: layout,
                        index: index,
                        products: productViewModel.topRatedProducts,
                      ),
                  shrinkWrap: true,
                ),
              ),
        ),
      ],
    );
  }
}
