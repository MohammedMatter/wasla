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
  Widget build(BuildContext context) {
    final AppLayout layout = context.read<AppLayout>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.md),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: layout.sm,
          mainAxisSpacing: layout.sm,
          childAspectRatio: 2.1,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];

          return Consumer2<ProductViewModel, SearchViewModel>(
            builder:
                (context, productViewModel, searchViewModel, child) => Material(
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
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: layout.xs),
                      child: Text(
                        Localizations.localeOf(context).languageCode == 'ar'
                            ? category.arName
                            : category.enName,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.lightSubtitle(layout).copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
          );
        },
      ),
    );
  }
}
