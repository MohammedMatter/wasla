import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/theme/design_tokens.dart';
import 'package:wasla/features/products/domain/entities/product.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';

// ignore: must_be_immutable
class ProductItem extends StatelessWidget {
  ProductItem({
    super.key,
    required this.layout,
    required this.index,
    required this.products,
  });
  List<Product> products;
  int index;
  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
      builder: (context, productViewModel, child) {
        return Padding(
          padding: EdgeInsets.only(
            right: layout.md,
            left: layout.md,
            bottom: layout.md,
          ),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(layout.rmd),
              border: Border.all(
                color: AppColors.lightPrimaryColor,
                width: 1.2,
              ),
              color: Color(0xffeef4f4),
            ),

            child: IntrinsicHeight(
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(layout.rmd),
                      child: SizedBox(
                        height: layout.fontXLarge * 3,
                        child: Image.network(
                          products[index].image,
                          colorBlendMode: BlendMode.multiply,
                          color: Color(0xffeef4f4),
                          errorBuilder:
                              (context, error, stackTrace) =>
                                  Icon(Icons.broken_image, color: Colors.amber),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: layout.sm),
                        Text(
                          textDirection: TextDirection.rtl,
                          products[index].name,
                          style: AppTextStyle.lightBody(
                            layout,
                          ).copyWith(fontSize: layout.fontMedium * 1.35),
                        ),
                        SizedBox(height: layout.sm),
                        Text(
                          textDirection: TextDirection.rtl,
                          products[index].price,
                          style: AppTextStyle.lightSubtitle(
                            layout,
                          ).copyWith(color: AppColors.lightPrimaryColor),
                        ),

                        Row(
                          textDirection: TextDirection.rtl,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              products[index].rating.toString(),
                              style: AppTextStyle.lightBody(layout).copyWith(
                                color: Color(0xffff9900),
                                fontSize: layout.fontMedium * 1.1,
                              ),
                            ),

                            Transform.translate(
                              offset: Offset(0, -0.5),
                              child: Icon(
                                size: layout.fontLarge,
                                Icons.star_border_purple500_rounded,
                                color: Color(0xffff9900),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: layout.sm),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: layout.sm),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Icon(
                              productViewModel.isFavorite(products[index].name)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                              size: layout.fontLarge,
                            ),
                            onTap: () {
                              productViewModel.toggleFavorite(products[index]);
                            },
                          ),

                          GestureDetector(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: layout.md,
                                vertical: layout.sm * 0.4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Color(0xffAAAAAA)),
                                borderRadius: BorderRadius.circular(layout.rmd),
                              ),
                              child: Icon(
                                color: AppColors.lightPrimaryColor,
                                Icons.shopping_cart_outlined,
                                size: AppFontSize.fontMedium * 1.25,
                              ),
                            ),

                            onTap: () {
                              productViewModel.selectProduct(
                                product: products[index],
                              );
                              productViewModel.selectRelatedProducts(
                                product: products[index],
                              );
                              GoRouter.of(
                                context,
                              ).pushNamed(AppRouter.productDetailView);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
