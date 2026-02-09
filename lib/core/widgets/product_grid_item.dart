import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';
import 'package:wasla/features/search/presentation/view_models/search_view_model.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({super.key, this.isFavoritesTab = false});
  final bool isFavoritesTab;

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Consumer2<ProductViewModel, SearchViewModel>(
      builder: (context, productViewModel, searchViewModel, child) {
        log(isFavoritesTab.toString());
        log('ads');
        final List filteredList =
            isFavoritesTab
                ? productViewModel.favoritesProduct
                : productViewModel.getFilteredProductsByCategory(
                  query: searchViewModel.searchQuery,
                );

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.md),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: GridView.builder(
              itemCount: filteredList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.72,
                mainAxisSpacing: layout.sm,
                crossAxisSpacing: layout.md,
                crossAxisCount: 2,
              ),
              itemBuilder:
                  (context, index) => Container(
                    padding: EdgeInsets.all(layout.md),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.lightPrimaryColor,
                        width: 1.4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.01),
                          offset: Offset(0, 3),
                          blurRadius: 5,
                          spreadRadius: 10,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(layout.md),
                    ),
                    child: Column(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return Center(
                                child: SizedBox(
                                  height: constraints.maxHeight * 0.85,
                                  width: constraints.maxWidth * 0.9,
                                  child: Image.network(
                                    filteredList[index].image,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            textDirection: TextDirection.rtl,
                            children: [
                              Text(
                                filteredList[index].name,
                                style: AppTextStyle.lightBody(layout).copyWith(
                                  color: Colors.black,
                                  fontSize: layout.fontMedium * 1.1,
                                ),
                              ),

                              Text(
                                filteredList[index].price,
                                style: AppTextStyle.lightBody(layout).copyWith(
                                  color: AppColors.lightPrimaryColor,
                                  fontSize: layout.fontMedium,
                                ),
                              ),
                              Text(
                                filteredList[index].description,
                                style: AppTextStyle.lightSubtitle(
                                  layout,
                                ).copyWith(color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                                textDirection: TextDirection.rtl,
                              ),
                              // SizedBox(height: layout.md),
                              Row(
                                children: [
                                  Expanded(
                                    child: Material(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1.55,
                                          color: AppColors.lightPrimaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          layout.rmd,
                                        ),
                                      ),

                                      child: InkWell(
                                        splashColor: AppColors.lightPrimaryColor
                                            .withOpacity(0.3),
                                        onTap: () {
                                          productViewModel.selectProduct(
                                            product: filteredList[index],
                                          );
                                          productViewModel
                                              .selectRelatedProducts(
                                                product: filteredList[index],
                                              );
                                          GoRouter.of(context).goNamed(
                                            AppRouter.productDetailView,
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: layout.sm * 0.55,
                                          ),
                                          child: Icon(
                                            Icons.shopping_cart_outlined,
                                            size: layout.fontLarge,
                                            color: AppColors.lightPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: layout.md),
                                  IconButton(
                                    icon: Icon(
                                      productViewModel.isFavorite(
                                            filteredList[index].name,
                                          )
                                          ? FontAwesomeIcons.heartCircleMinus
                                          : Icons.favorite_border,
                                      color: Colors.red,
                                      size: layout.fontLarge,
                                    ),
                                    onPressed: () {
                                      productViewModel.toggleFavorite(
                                        filteredList[index],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
          ),
        );
      },
    );
  }
}
