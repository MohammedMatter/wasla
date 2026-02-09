import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/home/presentation/widgets/search_home.dart';
import 'package:wasla/features/pharmacies/presentation/view_models/pharmacy_view_model.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';
import 'package:wasla/features/products/presentation/widgets/available_products_grid.dart';

class AvailableProductsView extends StatelessWidget {
  const AvailableProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Consumer<PharmacyViewModel>(
      builder:
          (context, pharmacyViewModel, child) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                pharmacyViewModel.selectedPharmacy?.name ?? '',
                style: AppTextStyle.lightHeading1(layout),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_circle_right_outlined,
                    color: AppColors.lightPrimaryColor,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            body: Consumer<ProductViewModel>(
              builder:
                  (context, productViewModel, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.rtl,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: layout.lg,
                          top: layout.xl,
                        ),
                        child: Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: AppColors.lightPrimaryColor,
                            ),
                            SizedBox(width: layout.sm),
                            Text(
                              pharmacyViewModel.selectedPharmacy?.address ?? '',
                              style: AppTextStyle.lightBody(
                                layout,
                              ).copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SearchHome(
                        canRequestFocus: true,
                        layout: layout,
                        hintText: 'ابحث عن المنتج الذي تريده',
                      ),
                      SizedBox(height: layout.md),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: layout.md),
                        child: Text(
                          'المنتجات المتوفرة',
                          style: AppTextStyle.lightHeading2(layout),
                        ),
                      ),
                      SizedBox(height: layout.md),
                      productViewModel.filteredProductsList.isEmpty
                          ? Text('لا توجد منتجات متوفرة')
                          : AvailableProductsGrid(),
                    ],
                  ),
            ),
          ),
    );
  }
}
