import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/home/domain/entities/category_entity.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';
import 'package:wasla/features/search/presentation/view_models/search_view_model.dart';

class GridCategories extends StatelessWidget {
  const GridCategories({super.key, required this.categories});

  final List<CategoryEntity> categories;

  @override
  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.read<AppLayout>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.md),
      child: Wrap(
        spacing: layout.sm,
        runSpacing: layout.sm,
        children:
            categories.map((category) {
              return Consumer2<ProductViewModel, SearchViewModel>(
                builder:
                    (context, productViewModel, searchViewModel, child) =>
                        IntrinsicWidth(
                          child: Material(
                            color: AppColors.lightPrimaryColor,
                            borderRadius: BorderRadius.circular(layout.rmd),
                            child: InkWell(
                              onTap: () {
                                productViewModel.selectProductCategory(
                                  category: category,
                                );

                                searchViewModel.reset();

                                GoRouter.of(
                                  context,
                                ).goNamed(AppRouter.categoryProductsView);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: layout.md,
                                  vertical: layout.sm,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  Localizations.localeOf(
                                            context,
                                          ).languageCode ==
                                          'ar'
                                      ? category.arName
                                      : category.enName,
                                  style: AppTextStyle.lightSubtitle(
                                    layout,
                                  ).copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
              );
            }).toList(),
      ),
    );
  }
}
