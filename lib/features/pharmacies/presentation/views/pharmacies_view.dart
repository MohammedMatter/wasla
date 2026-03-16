import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/utils/screen_size.dart';
import 'package:wasla/features/home/presentation/widgets/pharmacy_item.dart';
import 'package:wasla/features/home/presentation/widgets/search_home.dart';
import 'package:wasla/features/pharmacies/domain/entities/pharmacy.dart';
import 'package:wasla/features/pharmacies/presentation/view_models/pharmacy_view_model.dart';
import 'package:wasla/features/search/presentation/view_models/search_view_model.dart';

class PharmaciesView extends StatelessWidget {
  const PharmaciesView({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'الصيدليات',
          style: AppTextStyle.lightHeading1(layout).copyWith(
            fontSize: layout.fontLarge.clamp(18.0, 24.0),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.arrow_circle_right_outlined,
              color: AppColors.lightPrimaryColor,
              size: layout.fontXLarge,
            ),
            onPressed: () {
              GoRouter.of(context).pop();
              context.read<SearchViewModel>().reset();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchHome(hintText: 'ابحث عن اي صيدلية', canRequestFocus: true),
            PharmaciesContent(layout: layout),
          ],
        ),
      ),
    );
  }
}

class PharmaciesContent extends StatelessWidget {
  const PharmaciesContent({super.key, required this.layout});

  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    return Consumer<PharmacyViewModel>(
      builder:
          (context, pharmacyViewModel, child) => Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: layout.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: layout.md),
                        child: Text(
                          'الأعلى تقييم',
                          style: AppTextStyle.lightHeading1(layout),
                        ),
                      ),
                      SizedBox(height: layout.md),
                      SizedBox(
                        height: ScreenSize.h(context) * 0.23,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            pharmacyViewModel.topRatingPharmacies.length,
                            (index) => Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: layout.xs * 0.9,
                                ),
                                child: PharmacyItem(
                                  index: index,
                                  pharmacies:
                                      pharmacyViewModel.topRatingPharmacies,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: layout.md),
                      Padding(
                        padding: EdgeInsets.only(right: layout.md),
                        child: Text(
                          'الصيدليات',
                          style: AppTextStyle.lightHeading1(layout),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: layout.md),
                Consumer<SearchViewModel>(
                  builder: (context, searchViewModel, child) {
                    List<Pharmacy> filtrdList = pharmacyViewModel
                        .getFilteredPharmacies(
                          query: searchViewModel.searchQueryPharmacy,
                        );
                    if (filtrdList.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: layout.xl),
                          child: Text(
                            'لا توجد نتائج تطابق بحثك.',
                            style: AppTextStyle.lightSubtitle(
                              layout,
                            ).copyWith(fontSize: layout.fontMedium),
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder:
                            (context, index) => Padding(
                              padding: EdgeInsets.only(
                                right: layout.md,
                                left: layout.md,
                                bottom: layout.sm,
                              ),
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    layout.rmd,
                                  ),
                                  border: Border.all(
                                    color: AppColors.lightPrimaryColor,
                                    width: 1.2,
                                  ),
                                  color: Color(0xffeef4f4),
                                ),

                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: layout.xl * 1.75,
                                        margin: EdgeInsets.all(layout.sm),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: NetworkImage(
                                              filtrdList[index].image,
                                            ),
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        textDirection: TextDirection.rtl,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            filtrdList[index].name,
                                            style: AppTextStyle.lightHeading2(
                                              layout,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '${filtrdList[index].rating}',
                                                style: AppTextStyle.lightBody(
                                                  layout,
                                                ).copyWith(
                                                  color: Color(0xffff9900),
                                                ),
                                              ),

                                              Transform.translate(
                                                offset: Offset(0, -0.5),
                                                child: Icon(
                                                  Icons
                                                      .star_border_purple500_rounded,
                                                  color: Color(0xffff9900),
                                                ),
                                              ),
                                              SizedBox(width: layout.sm),
                                              Text(
                                                '${filtrdList[index].distance}km',
                                                style:
                                                    AppTextStyle.lightSubtitle(
                                                      layout,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: layout.sm),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              layout.rmd,
                                            ),
                                          ),
                                          backgroundColor:
                                              AppColors.lightPrimaryColor,
                                          foregroundColor: Colors.white,
                                        ),
                                        onPressed: () async {
                                          searchViewModel
                                              .updateProductSearchQuery('');
                                          pharmacyViewModel.selectPharmacy(
                                            pharmacy: filtrdList[index],
                                          );

                                          await pharmacyViewModel
                                              .fetchProductsByPharmacyId(
                                                pharmacyId:
                                                    filtrdList[index]
                                                        .pharmacyId,
                                              );

                                          GoRouter.of(context).pushNamed(
                                            AppRouter.availableProductsView,
                                          );
                                        },
                                        child: Text(
                                          'عرض',
                                          style: AppTextStyle.lightBody(
                                            layout,
                                          ).copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        itemCount: filtrdList.length,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
    );
  }
}
