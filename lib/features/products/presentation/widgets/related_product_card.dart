import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/theme/design_tokens.dart';
import 'package:wasla/core/utils/screen_size.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';

class RelatedProductCard extends StatelessWidget {
  const RelatedProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    final cardWidth = ScreenSize.w(context) * 0.4;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.rtl,
      children: [
        Text(
          'منتجات ذات صلة',
          textDirection: TextDirection.rtl,
          style: AppTextStyle.lightHeading2(
            layout,
          ).copyWith(fontSize: layout.fontMedium * 1.2),
        ),

        SizedBox(height: layout.sm),
        Consumer<ProductViewModel>(
          builder:
              (context, productViewModel, child) => AspectRatio(
                aspectRatio: 2.1,
                child: ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: productViewModel.relatedProducts.length,
                  itemBuilder:
                      (context, index) => GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          productViewModel.selectProduct(
                            product: productViewModel.relatedProducts[index],
                          );
                          log(productViewModel.relatedProducts[index].name);
                        },
                        child: Container(
                          width: cardWidth,
                          margin: EdgeInsets.only(left: layout.sm),
                          padding: EdgeInsets.all(layout.sm),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(layout.rmd),
                            border: Border.all(
                              color: AppColors.lightPrimaryColor.withOpacity(
                                0.3,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  productViewModel.relatedProducts[index].image,
                                ),
                              ),
                              Text(
                                productViewModel.relatedProducts[index].name,
                                style: AppTextStyle.lightSubtitle(
                                  layout,
                                ).copyWith(color: Colors.black),
                              ),
                              SizedBox(height: layout.sm),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    productViewModel
                                        .relatedProducts[index]
                                        .rating
                                        .toString(),
                                    style: AppTextStyle.lightBody(
                                      layout,
                                    ).copyWith(
                                      color: Colors.orange,
                                      fontSize: AppFontSize.fontSmall,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: layout.fontSmall,
                                  ),
                                  const Spacer(),
                                  Text(
                                    productViewModel
                                        .relatedProducts[index]
                                        .price,
                                    textDirection: TextDirection.rtl,
                                    style: AppTextStyle.lightBody(
                                      layout,
                                    ).copyWith(
                                      color: AppColors.lightPrimaryColor,
                                      fontSize: AppFontSize.fontSmall,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                ),
              ),
        ),
      ],
    );
  }
}
