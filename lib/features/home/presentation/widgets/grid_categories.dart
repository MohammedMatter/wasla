import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';
import 'package:wasla/features/search/presentation/view_models/search_view_model.dart';

class GridCategories extends StatelessWidget {
  const GridCategories({super.key, required this.categories});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.read<AppLayout>();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: layout.xl),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: layout.sm,
        mainAxisSpacing: layout.md,
        childAspectRatio: 2.5,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Consumer2<ProductViewModel, SearchViewModel>(
          builder:
              (context, productViewModel, searchViewModel, child) => Material(
                color: AppColors.lightPrimaryColor,
                borderRadius: BorderRadius.circular(layout.md),
                child: InkWell(
                  borderRadius: BorderRadius.circular(layout.md),
                  splashColor: const Color.fromARGB(
                    255,
                    19,
                    150,
                    63,
                  ).withOpacity(0.3),
                  onTap: () {
                    productViewModel.selectProductCategory(
                      productCategory: categories[index],
                    );
                    searchViewModel.reset();
                    GoRouter.of(
                      context,
                    ).goNamed(AppRouter.categoryProductsView);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: layout.sm),
                    alignment: Alignment.center,
                    child: Text(
                      categories[index],
                      style: AppTextStyle.lightSubtitle(layout).copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: layout.fontMedium * 1.1,
                      ),
                    ),
                  ),
                ),
              ),
        );
      },
    );
  }
}
