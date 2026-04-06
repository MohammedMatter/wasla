import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/utils/screen_size.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';

class HeaderProductDetail extends StatelessWidget {
  const HeaderProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Consumer<ProductViewModel>(
      builder:
          (context, productViewModel, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: ScreenSize.h(context) * 0.24,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(layout.rmd),
                    ),
                    child: Center(
                      child: Image.network(
                        productViewModel.selectedProduct!.image,
                        errorBuilder:
                            (context, error, stackTrace) =>
                                Icon(Icons.broken_image, color: Colors.amber),
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    top: layout.sm,
                    end: layout.sm,
                    child: IconButton(
                      icon: Icon(
                        productViewModel.isFavorite(
                              productViewModel.selectedProduct!.id,
                            )
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color:
                            productViewModel.isFavorite(
                                  productViewModel.selectedProduct!.id,
                                )
                                ? Colors.red
                                : AppColors.lightPrimaryColor,
                        size: layout.fontLarge,
                      ),
                      onPressed: () {
                        productViewModel.toggleFavorite(
                          productViewModel.selectedProduct!,
                        );
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: layout.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    productViewModel
                        .selectedProduct!
                        .name[Localizations.localeOf(context).languageCode],
                    style: AppTextStyle.lightHeading1(layout).copyWith(
                      fontSize: layout.fontMedium,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: layout.sm),
                    child: Text(
                      "${productViewModel.selectedProduct!.price} ${Localizations.localeOf(context).languageCode == 'ar' ? 'شيكل' : 'NIS'}",

                      style: AppTextStyle.lightSubtitle(layout).copyWith(
                        color: AppColors.lightPrimaryColor,
                        fontSize: layout.fontMedium,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: layout.xs),
              Text(
                productViewModel.selectedProduct!.type[Localizations.localeOf(
                  context,
                ).languageCode],

                style: AppTextStyle.lightBody(
                  layout,
                ).copyWith(color: Colors.grey),
              ),

              SizedBox(height: layout.sm),
              Text(
                productViewModel
                    .selectedProduct!
                    .description[Localizations.localeOf(context).languageCode],
                textAlign: TextAlign.justify,
                style: AppTextStyle.lightBody(
                  layout,
                ).copyWith(height: 1.5, fontSize: layout.fontSmall),
              ),
            ],
          ),
    );
  }
}
