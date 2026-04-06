import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/constants/lang_keys.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/home/presentation/widgets/search_home.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';
import 'package:wasla/features/products/presentation/widgets/product_item.dart';
import 'package:wasla/features/search/presentation/view_models/search_view_model.dart';

class CategoryProductsView extends StatelessWidget {
  const CategoryProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Consumer2<ProductViewModel, SearchViewModel>(
      builder:
          (context, productViewModel, searchViewModel, child) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                productViewModel.selectedCategory,
                style: AppTextStyle.lightHeading1(layout),
              ),

              leading: IconButton(
                icon: Icon(
                  context.locale.languageCode == Locale('ar').languageCode
                      ? Icons.arrow_circle_right_outlined
                      : Icons.arrow_circle_left_outlined,

                  color: AppColors.lightPrimaryColor,

                  size: layout.fontXLarge.clamp(24.0, 32.0),
                ),
                onPressed: () {
                  searchViewModel.reset();
                  Navigator.pop(context);
                },
              ),
            ),
            body:
                productViewModel.selectedProductsList.isNotEmpty
                    ? Column(
                      children: [
                        SearchHome(
                          canRequestFocus: true,

                          hintText: LangKeys.searchProduct.tr(),
                        ),
                        Consumer2<ProductViewModel, SearchViewModel>(
                          builder:
                              (
                                context,
                                productViewModel,
                                searchViewModel,
                                child,
                              ) => Expanded(
                                child: ListView.builder(
                                  itemCount:
                                      searchViewModel
                                          .getSearchAndFilteredProducts(
                                            searchViewModel.searchQueryProduct,
                                            productViewModel
                                                .selectedProductsList,
                                          )
                                          .length,
                                  itemBuilder:
                                      (context, index) => ProductItem(
                                        layout: layout,
                                        index: index,
                                        products: searchViewModel
                                            .getSearchAndFilteredProducts(
                                              searchViewModel
                                                  .searchQueryProduct,
                                              productViewModel
                                                  .selectedProductsList,
                                            ),
                                      ),
                                ),
                              ),
                        ),
                      ],
                    )
                    : Center(
                      child: Text(
                        Localizations.localeOf(context).languageCode == 'ar'
                            ? 'لا يوجد عناصر متاحة'
                            : 'There are no items available',
                        style: AppTextStyle.lightSubtitle(layout),
                      ),
                    ),
          ),
    );
  }
}
