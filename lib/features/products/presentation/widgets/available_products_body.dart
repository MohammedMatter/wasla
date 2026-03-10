import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/home/presentation/widgets/search_home.dart';
import 'package:wasla/features/pharmacies/presentation/view_models/pharmacy_view_model.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';
import 'package:wasla/features/products/presentation/widgets/available_products.dart';

class AvailableProductsBody extends StatelessWidget {
  const AvailableProductsBody({super.key, required this.layout});

  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    return Consumer2<ProductViewModel, PharmacyViewModel>(
      builder:
          (
            context,
            productViewModel,
            pharmacyViewModel,
            child,
          ) => Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: EdgeInsets.only(top: layout.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                textDirection: TextDirection.rtl,
                children: [
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,

                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: layout.md),
                            CircleAvatar(
                              radius: layout.fontXLarge * 2,
                              foregroundImage: NetworkImage(
                                pharmacyViewModel.selectedPharmacy!.image,
                              ),
                            ),
                            SizedBox(width: layout.md),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  pharmacyViewModel.selectedPharmacy!.name,
                                  style: AppTextStyle.lightHeading1(
                                    layout,
                                  ).copyWith(fontSize: layout.fontLarge * 0.8),
                                ),
                                SizedBox(height: layout.sm),
                                Text(
                                  '0595541004',
                                  style: AppTextStyle.lightSubtitle(layout),
                                ),
                                SizedBox(height: layout.sm),
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Icon(
                                      size: layout.fontLarge,
                                      Icons.location_on_outlined,
                                      color: AppColors.lightPrimaryColor,
                                    ),

                                    Text(
                                      pharmacyViewModel
                                              .selectedPharmacy
                                              ?.address ??
                                          '',
                                      style: AppTextStyle.lightSubtitle(
                                        layout,
                                      ).copyWith(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SearchHome(
                    canRequestFocus: true,
                    layout: layout,
                    hintText: 'ابحث عن المنتج الذي تريده',
                  ),

                  Container(
                    width: double.infinity,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: layout.xl),
                          child: Text(
                            'المنتجات المتوفرة',
                            style: AppTextStyle.lightHeading1(layout),
                          ),
                        ),
                        SizedBox(height: layout.md),
                      ],
                    ),
                  ),

                  productViewModel.filteredProductsList.isEmpty
                      ? Text('لا توجد منتجات متوفرة')
                      : AvailableProducts(),
                ],
              ),
            ),
          ),
    );
  }
}
