import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/home/presentation/view_models/home_view_model.dart';
import 'package:wasla/features/home/presentation/widgets/pharmacy_item.dart';
import 'package:wasla/features/pharmacies/presentation/view_models/pharmacy_view_model.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';

class PharmaciesSection extends StatelessWidget {
  const PharmaciesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.read<AppLayout>();
    return Consumer2<PharmacyViewModel, ProductViewModel>(
      builder:
          (context, pharmacyViewModel, productViewModel, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: layout.md),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          'الصيدليات',
                          style: AppTextStyle.lightHeading2(
                            layout,
                          ).copyWith(fontSize: layout.fontMedium),
                        ),
                        Column(
                          children: [
                            Consumer<HomeViewModel>(
                              builder:
                                  (context, homeViewModel, child) => Padding(
                                    padding: EdgeInsets.only(left: layout.lg),
                                    child: IconButton(
                                      highlightColor: Color(0xffeef4f4),
                                      alignment: Alignment.center,

                                      icon: Icon(Icons.arrow_back_ios),
                                      onPressed: () {
                                        GoRouter.of(
                                          context,
                                        ).pushNamed(AppRouter.pharmaciesView);
                                      },
                                    ),
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: layout.md),
                    pharmacyViewModel.pharmacies.isNotEmpty &&
                            !pharmacyViewModel.isFetching
                        ? Consumer2<PharmacyViewModel, HomeViewModel>(
                          builder:
                              (
                                context,
                                pharmacyViewModel,
                                homeViewModel,
                                child,
                              ) => Directionality(
                                textDirection: TextDirection.rtl,
                                child: SizedBox(
                                  height: (MediaQuery.of(context).size.height *
                                          0.25)
                                      .clamp(180.0, 260.0),
                                  child: GridView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount:
                                        pharmacyViewModel.pharmacies.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          childAspectRatio: 1.5.clamp(1.5, 5),
                                          mainAxisSpacing: layout.sm,
                                        ),
                                    itemBuilder:
                                        (context, index) => PharmacyItem(
                                          index: index,
                                          pharmacies:
                                              pharmacyViewModel.pharmacies,
                                        ),
                                  ),
                                ),
                              ),
                        )
                        : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'لا يوجد صيدليات متاحة في الوقت الحالي , سيتم اضافة الصيدليات على التطبيق قريبا , اتمنى ان تتواصل مع الدعم لتاكيد طلبك',
                            style: AppTextStyle.lightHeading2(layout),
                            textAlign: TextAlign.center,
                          ),
                        ),
                  ],
                ),
              ),
              SizedBox(height: layout.xl * 3),
            ],
          ),
    );
  }
}
