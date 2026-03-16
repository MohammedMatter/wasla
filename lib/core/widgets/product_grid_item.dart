import 'package:flutter/material.dart';
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
        final List filteredList =
            isFavoritesTab
                ? productViewModel.favoritesProduct
                : productViewModel.getFilteredProductsByCategory(
                  query: searchViewModel.searchQueryProduct,
                );

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.md),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: GridView.builder(
              itemCount: filteredList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.77,
                mainAxisSpacing: layout.md,
                crossAxisSpacing: layout.md,
                crossAxisCount: 2,
              ),
              itemBuilder:
                  (context, index) => Container(
                    padding: EdgeInsets.all(layout.md),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.lightPrimaryColor,
                        width: 1.6,
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
                      borderRadius: BorderRadius.circular(layout.rlg * 1.8),
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
                                  height: constraints.maxHeight * 0.95,
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
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyle.lightBody(layout).copyWith(
                                  color: Colors.black,
                                  fontSize: layout.fontMedium * 1.1,
                                ),
                              ),
                              SizedBox(height: layout.sm),
                              Text(
                                filteredList[index].price,
                                style: AppTextStyle.lightBody(layout).copyWith(
                                  color: AppColors.lightPrimaryColor,
                                  fontSize: layout.fontMedium,
                                ),
                              ),
                              SizedBox(height: layout.sm),
                              Text(
                                filteredList[index].description,
                                style: AppTextStyle.lightSubtitle(
                                  layout,
                                ).copyWith(color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                                textDirection: TextDirection.rtl,
                              ),
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
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.red,
                                      size: layout.fontLarge * 1.3,
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
