import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';

class RelatedProductCard extends StatelessWidget {
  const RelatedProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    final cardWidth = (MediaQuery.sizeOf(context).width * 0.35).clamp(
      140.0,
      180.0,
    );

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: layout.sm),
            child: Text(
              'منتجات ذات صلة',
              style: AppTextStyle.lightHeading2(layout).copyWith(
                fontSize: layout.fontMedium.clamp(14.0, 18.0),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: layout.sm),
          Consumer<ProductViewModel>(
            builder:
                (context, productViewModel, child) => SizedBox(
                  height: (MediaQuery.sizeOf(context).height * 0.22).clamp(
                    170.0,
                    220.0,
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: layout.sm),
                    itemCount: productViewModel.relatedProducts.length,
                    itemBuilder: (context, index) {
                      final product = productViewModel.relatedProducts[index];
                      return GestureDetector(
                        onTap:
                            () => productViewModel.selectProduct(
                              product: product,
                            ),
                        child: Container(
                          width: cardWidth,
                          margin: EdgeInsets.only(left: layout.sm),
                          padding: EdgeInsets.all(layout.xs),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(layout.rmd),
                            border: Border.all(
                              color: AppColors.lightPrimaryColor.withOpacity(
                                0.4,
                              ),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Image.network(
                                  product.image,
                                  fit: BoxFit.contain,
                                  errorBuilder:
                                      (context, _, __) => Icon(
                                        Icons.medication,
                                        color: Colors.grey,
                                        size: layout.lg.clamp(20.0, 30.0),
                                      ),
                                ),
                              ),
                              SizedBox(height: layout.xs),
                              Flexible(
                                child: Text(
                                  product.name,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.lightSubtitle(
                                    layout,
                                  ).copyWith(
                                    fontSize: layout.fontSmall.clamp(
                                      11.0,
                                      14.0,
                                    ),
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.price,
                                    style: TextStyle(
                                      color: AppColors.lightPrimaryColor,
                                      fontSize: (layout.fontSmall * 0.9).clamp(
                                        10.0,
                                        13.0,
                                      ),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        product.rating.toString(),
                                        style: TextStyle(
                                          fontSize: (layout.fontSmall * 0.8)
                                              .clamp(9.0, 12.0),
                                          color: const Color(0xffff9900),
                                        ),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: const Color(0xffff9900),
                                        size: 14.0,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
