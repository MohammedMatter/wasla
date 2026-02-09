import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/pharmacies/presentation/view_models/pharmacy_view_model.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';
import 'package:wasla/features/search/presentation/view_models/search_view_model.dart';

class AvailableProductsGrid extends StatelessWidget {
  const AvailableProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Consumer2<PharmacyViewModel, SearchViewModel>(
      builder: (context, pharmacyViewModel, searchViewModel, child) {
        final filteredList = pharmacyViewModel.getFilteredProductsByPharmacy(
          query: searchViewModel.searchQuery,
        );
        return Expanded(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: layout.md),
              child: GridView.builder(
                itemCount: filteredList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.9,
                  mainAxisSpacing: layout.sm,
                  crossAxisSpacing: layout.md,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Container(
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
                                  width: constraints.maxWidth * 0.9,
                                  height: constraints.maxHeight * 0.8,
                                  child: Image.network(
                                    filteredList[index].image,
                                    cacheWidth: 300,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: layout.sm),
                        Column(
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
                            SizedBox(height: layout.md),
                            Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                Consumer<ProductViewModel>(
                                  builder:
                                      (
                                        context,
                                        productViewModel,
                                        child,
                                      ) => Expanded(
                                        child: Material(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              layout.rmd,
                                            ),
                                            side: BorderSide(
                                              color:
                                                  AppColors.lightPrimaryColor,
                                            ),
                                          ),

                                          child: InkWell(
                                            onTap: () {
                                              productViewModel.selectProduct(
                                                product: filteredList[index],
                                              );
                                              productViewModel
                                                  .selectRelatedProducts(
                                                    product:
                                                        filteredList[index],
                                                  );
                                              GoRouter.of(context).goNamed(
                                                AppRouter.productDetailView,
                                              );
                                            },
                                            splashColor: AppColors
                                                .lightPrimaryColor
                                                .withOpacity(0.3),

                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: layout.sm * 0.3,
                                              ),
                                              child: Icon(
                                                Icons.shopping_cart_outlined,
                                                size: layout.fontLarge,
                                                color:
                                                    AppColors.lightPrimaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                ),
                                SizedBox(width: layout.md),
                                Consumer<ProductViewModel>(
                                  builder:
                                      (context, productViewModel, child) =>
                                          IconButton(
                                            icon: Icon(
                                              productViewModel.isFavorite(
                                                    filteredList[index].name,
                                                  )
                                                  ? FontAwesomeIcons
                                                      .heartCircleMinus
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
