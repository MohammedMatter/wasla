import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/widgets/product_grid_item.dart';
import 'package:wasla/features/home/presentation/widgets/search_home.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';
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
              actions: [
                IconButton(
                  icon: const Icon(Icons.arrow_circle_right_outlined),
                  onPressed: () {
                    searchViewModel.reset();

                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            body: Column(
              children: [
                SearchHome(
                  canRequestFocus: true,
                  layout: layout,
                  hintText: 'ابحث عن المنتج الذي تريده',
                ),
                Consumer<ProductViewModel>(
                  builder:
                      (context, productViewModel, child) =>
                          Expanded(child: ProductGridItem()),
                ),
              ],
            ),
          ),
    );
  }
}
