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
            textDirection: TextDirection.rtl,
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
                      ),
                    ),
                  ),
                  Positioned(
                    top: layout.sm,
                    left: layout.sm,
                    child: IconButton(
                      icon: Icon(
                        productViewModel.isFavorite(
                              productViewModel.selectedProduct!.name,
                            )
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color:
                            productViewModel.isFavorite(
                                  productViewModel.selectedProduct!.name,
                                )
                                ? Colors.red
                                : AppColors.lightPrimaryColor,
                        size: layout.fontLarge * 1.5,
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
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    productViewModel.selectedProduct!.name,
                    style: AppTextStyle.lightHeading2(layout).copyWith(
                      fontSize: layout.fontLarge,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                productViewModel.selectedProduct!.price,
                textDirection: TextDirection.rtl,
                style: AppTextStyle.lightSubtitle(layout).copyWith(
                  color: AppColors.lightPrimaryColor,
                  fontSize: layout.fontMedium * 1.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: layout.xs),
              Text(
                productViewModel.selectedProduct!.type,
                textDirection: TextDirection.rtl,
                style: AppTextStyle.lightBody(
                  layout,
                ).copyWith(color: Colors.grey),
              ),

              SizedBox(height: layout.md),
              Text(
                productViewModel.selectedProduct!.description,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.justify,
                style: AppTextStyle.lightBody(
                  layout,
                ).copyWith(height: 1.5, fontSize: layout.fontMedium),
              ),
            ],
          ),
    );
  }
}
