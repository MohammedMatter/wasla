import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';
import 'package:wasla/features/products/presentation/widgets/product_item.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.read<AppLayout>();
    return Consumer<ProductViewModel>(
      builder:
          (context, productViewModel, child) =>
              productViewModel.favoritesProduct.isEmpty
                  ? Center(
                    child: Text(
                      'لا يوجد منتجات مفضلة',
                      style: AppTextStyle.lightBody(layout),
                    ),
                  )
                  : Padding(
                    padding: EdgeInsets.only(top: layout.lg),
                    child: ListView.builder(
                      itemBuilder:
                          (context, index) => ProductItem(
                            layout: layout,
                            index: index,
                            products: productViewModel.favoritesProduct,
                          ),
                      itemCount: productViewModel.favoritesProduct.length,
                    ),
                  ),
    );
  }
}
