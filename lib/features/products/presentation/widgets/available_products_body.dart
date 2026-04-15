import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/constants/lang_keys.dart';
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
          (context, productViewModel, pharmacyViewModel, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,

                child: Column(
                  children: [
                    SizedBox(height: layout.lg),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: layout.fontXLarge * 1.2,
                          foregroundImage: NetworkImage(
                            pharmacyViewModel.selectedPharmacy!.image,
                          ),
                        ),

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: layout.sm),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  pharmacyViewModel
                                      .selectedPharmacy!
                                      .name[Localizations.localeOf(
                                    context,
                                  ).languageCode]!,
                                  style: AppTextStyle.lightHeading1(
                                    layout,
                                  ).copyWith(height: 0.5),
                                ),
                                SizedBox(height: layout.sm),
                                Text(
                                  '0595541004',
                                  style: AppTextStyle.lightSubtitle(layout),
                                ),
                                SizedBox(height: layout.sm),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      size: layout.fontMedium,
                                      Icons.location_on_outlined,
                                      color: AppColors.lightPrimaryColor,
                                    ),
                                    SizedBox(width: layout.sm),
                                    Expanded(
                                      child: Text(
                                        pharmacyViewModel
                                                .selectedPharmacy
                                                ?.address[Localizations.localeOf(
                                              context,
                                            ).languageCode] ??
                                            '',
                                        style: AppTextStyle.lightSubtitle(
                                          layout,
                                        ).copyWith(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SearchHome(
                canRequestFocus: true,

                hintText: LangKeys.searchProduct.tr(),
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
                        LangKeys.availableProductsTitle.tr(),
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
    );
  }
}
