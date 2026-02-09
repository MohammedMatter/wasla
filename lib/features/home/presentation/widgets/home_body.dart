import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/home/presentation/view_models/home_view_model.dart';
import 'package:wasla/features/home/presentation/widgets/featured_products.dart';
import 'package:wasla/features/home/presentation/widgets/grid_categories.dart';
import 'package:wasla/features/home/presentation/widgets/offers.dart';
import 'package:wasla/features/home/presentation/widgets/search_home.dart';
import 'package:wasla/features/pharmacies/presentation/view_models/pharmacy_view_model.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key});
  final List<String> categories = [
    'العناية بالطفل',
    'العناية بالأم',
    'الفم والأسنان',
    'العناية بالشعر',
    'العناية بالبشرة',
    'مستلزمات طبية',
  ];

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.read<AppLayout>();
    return Column(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchHome(layout: layout, hintText: 'ابحث عن المنتج الذي تريده'),

        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                GridCategories(layout: layout, categories: categories),
                SizedBox(height: layout.xl),
                Offers(),
                SizedBox(height: layout.md),
                FeaturedProducts(layout: layout),
                SizedBox(height: layout.md),
                Column(
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
                                ).copyWith(fontSize: layout.fontMedium * 1.5),
                              ),
                              Consumer<HomeViewModel>(
                                builder:
                                    (context, homeViewModel, child) => Padding(
                                      padding: EdgeInsets.only(left: layout.lg),
                                      child: TextButton(
                                        child: Text(
                                          homeViewModel.showAllPharmacies
                                              ? 'عرض اقل'
                                              : 'عرض المزيد',
                                          style:
                                              AppTextStyle.lightSubtitle(
                                                layout,
                                              ).copyWith(),
                                        ),
                                        onPressed: () {
                                          homeViewModel
                                              .toogleShowAllPharmacies();
                                        },
                                      ),
                                    ),
                              ),
                            ],
                          ),
                          Consumer2<PharmacyViewModel, HomeViewModel>(
                            builder:
                                (
                                  context,
                                  pharmacyViewModel,
                                  homeViewModel,
                                  child,
                                ) => AnimatedSize(
                                  duration: Duration(seconds: 1),
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,

                                    itemCount:
                                        homeViewModel.showAllPharmacies
                                            ? pharmacyViewModel
                                                .pharmacies
                                                .length
                                            : 2,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 0.9,
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 10,
                                        ),
                                    itemBuilder:
                                        (context, index) => GestureDetector(
                                          onTap: () async {
                                            pharmacyViewModel.selectPharmacy(
                                              pharmacy:
                                                  pharmacyViewModel
                                                      .pharmacies[index],
                                            );
                                            await pharmacyViewModel
                                                .fetchProductsByPharmacyId(
                                                  pharmacyId:
                                                      pharmacyViewModel
                                                          .pharmacies[index]
                                                          .pharmacy_id,
                                                );
                                            GoRouter.of(context).goNamed(
                                              AppRouter.availableProductsView,
                                            );
                                          },
                                          child: Container(
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    layout.rmd,
                                                  ),
                                            ),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 5,
                                                  child: Image.network(
                                                    width: double.infinity,
                                                    pharmacyViewModel
                                                        .pharmacies[index]
                                                        .image,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.all(
                                                      layout.sm * 0.3,
                                                    ),
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColors
                                                              .lightPrimaryColor,
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                            top:
                                                                Radius.circular(
                                                                  layout.md,
                                                                ),
                                                          ),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      pharmacyViewModel
                                                          .pharmacies[index]
                                                          .name,
                                                      style:
                                                          AppTextStyle.lightBody(
                                                            layout,
                                                          ).copyWith(
                                                            color: Colors.white,
                                                            fontSize:
                                                                layout
                                                                    .fontMedium *
                                                                1.2,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                  ),
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: layout.xl * 3),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
