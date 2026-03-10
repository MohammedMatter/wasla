import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/products/domain/entities/product_filter_type.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';
import 'package:wasla/features/products/presentation/widgets/product_item.dart';
import 'package:wasla/features/home/presentation/widgets/search_home.dart';
import 'package:wasla/features/search/presentation/view_models/search_view_model.dart';

// ignore: must_be_immutable
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('البحث', style: AppTextStyle.lightHeading1(layout)),
        actions: [
          Consumer<SearchViewModel>(
            builder:
                (context, searchViewModel, child) => IconButton(
                  icon: const Icon(Icons.arrow_circle_right_outlined),
                  onPressed: () {
                    searchViewModel.reset();
                    Navigator.pop(context);
                  },
                ),
          ),
        ],
      ),
      body: Column(
        children: [
          SearchHome(
            layout: layout,
            hintText: 'ابحث عن المنتج الذي تريده',
            canRequestFocus: true,
          ),
          SizedBox(height: layout.md),

          Consumer2<SearchViewModel, ProductViewModel>(
            builder:
                (
                  context,
                  searchViewModel,
                  productViewModel,
                  child,
                ) => Container(
                  color: AppColors.lightBackgroundColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: layout.md),
                    child: Wrap(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: WrapCrossAlignment.end,
                      spacing: layout.sm,
                      children: List.generate(
                        ProductFilterType.values.length,
                        (index) => GestureDetector(
                          onTap: () {
                            searchViewModel.toogleIndex(index: index);
                            productViewModel.selectFiltredProducts(
                              type: ProductFilterType.values[index],
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: layout.md * 1.3,
                              vertical: layout.sm * 0.5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(layout.rmd),
                              border: Border.all(
                                color: AppColors.lightPrimaryColor,
                                width: 1.15,
                              ),
                              color:
                                  searchViewModel.selectedIndex == index
                                      ? AppColors.lightPrimaryColor
                                      : Color(0xffeef4f4),
                            ),
                            child: Text(
                              ProductFilterType.values[index].arabicName,
                              style: AppTextStyle.lightBody(layout).copyWith(
                                fontSize: layout.md * 1.2,
                                color:
                                    searchViewModel.selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          ),
          SizedBox(height: layout.lg),
          Consumer2<ProductViewModel, SearchViewModel>(
            builder:
                (context, productViewModel, searchViewModel, child) =>
                    searchViewModel
                            .getSearchAndFilteredProducts(
                              searchViewModel.searchQueryProduct,
                              productViewModel.filteredProductsList,
                            )
                            .isEmpty
                        ? Padding(
                          padding: EdgeInsets.all(layout.xl),
                          child: Text(
                            'عذراً، لم نتمكن من العثور على هذا المنتج حاليا',
                            style: AppTextStyle.lightBody(layout),
                            textAlign: TextAlign.center,
                          ),
                        )
                        : Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder:
                                (context, index) => ProductItem(
                                  layout: layout,
                                  index: index,
                                  products: searchViewModel
                                      .getSearchAndFilteredProducts(
                                        searchViewModel.searchQueryProduct,
                                        productViewModel.filteredProductsList,
                                      ),
                                ),
                            itemCount:
                                searchViewModel
                                    .getSearchAndFilteredProducts(
                                      searchViewModel.searchQueryProduct,
                                      productViewModel.filteredProductsList,
                                    )
                                    .length,
                          ),
                        ),
          ),
        ],
      ),
    );
  }
}
