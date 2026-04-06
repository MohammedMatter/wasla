import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/constants/lang_keys.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/home/presentation/view_models/home_view_model.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';
import 'package:wasla/features/products/presentation/widgets/product_item.dart';

class FeaturedProducts extends StatelessWidget {
  const FeaturedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.read<AppLayout>();
    return Consumer<ProductViewModel>(
      builder:
          (context, productViewModel, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: layout.md),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text(
                          LangKeys.featuredProducts.tr(),
                          style: AppTextStyle.lightHeading2(
                            layout,
                          ).copyWith(fontSize: layout.fontMedium),
                        ),
                        productViewModel.topRatedProducts.isNotEmpty
                            ? Consumer<HomeViewModel>(
                              builder:
                                  (context, homeViewModel, child) => Padding(
                                    padding: EdgeInsets.only(left: layout.lg),
                                    child: TextButton(
                                      child: Text(
                                        homeViewModel.showAllFeaturedProducts
                                            ? LangKeys.showLess.tr()
                                            : LangKeys.showMore.tr(),
                                        style: AppTextStyle.lightSubtitle(
                                          layout,
                                        ).copyWith(fontSize: layout.fontSmall),
                                      ),
                                      onPressed: () {
                                        homeViewModel
                                            .toogleShowAllFeaturedProducts();
                                      },
                                    ),
                                  ),
                            )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: layout.xs),
              productViewModel.topRatedProducts.isNotEmpty
                  ? Consumer2<HomeViewModel, ProductViewModel>(
                    builder:
                        (
                          context,
                          homeViewModel,
                          productViewModel,
                          child,
                        ) => AnimatedSize(
                          curve: Curves.decelerate,
                          duration: Duration(milliseconds: 680),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                homeViewModel.showAllFeaturedProducts
                                    ? productViewModel.topRatedProducts.length
                                    : productViewModel
                                        .topRatedProducts
                                        .isNotEmpty
                                    ? 2
                                    : 0,
                            itemBuilder:
                                (context, index) => ProductItem(
                                  layout: layout,
                                  index: index,
                                  products: productViewModel.topRatedProducts,
                                ),
                            shrinkWrap: true,
                          ),
                        ),
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: layout.xl),
                    child: Center(
                      child: Text(
                        'لا يوجد عناصر متاحة',
                        style: AppTextStyle.lightSubtitle(layout),
                      ),
                    ),
                  ),
            ],
          ),
    );
  }
}
