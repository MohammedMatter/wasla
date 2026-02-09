import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';

class PharmaciesContent extends StatelessWidget {
  const PharmaciesContent({super.key, required this.layout});

  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: layout.md),
        child: GridView.builder(
          itemCount: 30,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.2,
            mainAxisSpacing: layout.sm,
            crossAxisSpacing: layout.md,
            crossAxisCount: 2,
          ),
          itemBuilder:
              (context, index) => GestureDetector(
                onTap: () {
                  GoRouter.of(context).goNamed(AppRouter.availableProductsView);
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/pharmacies/saif_pharmacy.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(layout.md),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.lightPrimaryColor,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15),
                            ),
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(layout.sm * 0.3),
                          width: 20,
                          child: Text(
                            'صيدلية سيف',
                            style: AppTextStyle.lightHeading2(
                              layout,
                            ).copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
