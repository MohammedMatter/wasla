import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/utils/screen_size.dart';
import 'package:wasla/features/home/presentation/view_models/home_view_model.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';

//******************************* */
class ShimmerHomeEffect extends StatelessWidget {
  const ShimmerHomeEffect({super.key, required this.layout});

  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: layout.xl * 2,
            margin: EdgeInsets.only(
              left: layout.xl,
              right: layout.xl,
              top: layout.lg,
              bottom: layout.md,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(layout.sm),
            ),
          ),
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: layout.xl),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: layout.sm,
              mainAxisSpacing: layout.md,
              childAspectRatio: 2.5,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Consumer<ProductViewModel>(
                builder:
                    (context, productViewModel, child) => Material(
                      borderRadius: BorderRadius.circular(layout.md),
                    ),
              );
            },
          ),
        ),
        SizedBox(height: layout.xl),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!, // اللون الأساسي
          highlightColor: Colors.grey[100]!, // لون اللمعة
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: layout.lg),
                child: Container(
                  color: Colors.grey[300]!,
                  child: Text('العروض و الخصومات'),
                ),
              ),
              SizedBox(height: layout.md),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(layout.rmd),
                ),
                height: ScreenSize.w(context) * 0.27,
                margin: EdgeInsets.symmetric(horizontal: layout.md),
              ),
              SizedBox(height: layout.md),
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: layout.sm),
                    child: CircleAvatar(radius: layout.rsm),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: layout.md),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[200]!,
          child: Column(
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
                        Material(
                          child: Text(
                            'المنتجات المميزة ',
                            style: AppTextStyle.lightHeading2(
                              layout,
                            ).copyWith(fontSize: layout.fontMedium * 1.5),
                          ),
                        ),
                        Consumer<HomeViewModel>(
                          builder:
                              (context, homeViewModel, child) => Material(
                                child: Padding(
                                  padding: EdgeInsets.only(left: layout.lg),
                                  child: Text(
                                    homeViewModel.showAllFeaturedProducts
                                        ? 'عرض اقل'
                                        : 'عرض المزيد',
                                    style:
                                        AppTextStyle.lightSubtitle(
                                          layout,
                                        ).copyWith(),
                                  ),
                                ),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: layout.md),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder:
                    (context, index) => Padding(
                      padding: EdgeInsets.all(layout.sm),
                      child: Material(
                        child: Container(
                          height: ScreenSize.h(context) * 0.086,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(layout.rmd),
                          ),
                        ),
                      ),
                    ),
                shrinkWrap: true,
              ),
            ],
          ),
        ),
        SizedBox(height: layout.md),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!, // اللون الأساسي
          highlightColor: Colors.grey[100]!, // لون اللمعة
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: layout.md),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: TextDirection.rtl,
                  children: [
                    Material(
                      child: Text(
                        'المنتجات المميزة ',
                        style: AppTextStyle.lightHeading2(
                          layout,
                        ).copyWith(fontSize: layout.fontMedium * 1.5),
                      ),
                    ),
                    Consumer<HomeViewModel>(
                      builder:
                          (context, homeViewModel, child) => Material(
                            child: Padding(
                              padding: EdgeInsets.only(left: layout.lg),
                              child: Text(
                                homeViewModel.showAllFeaturedProducts
                                    ? 'عرض اقل'
                                    : 'عرض المزيد',
                              ),
                            ),
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(layout.md),
                child: GridView.builder(
                  itemBuilder:
                      (context, index) => Material(
                        borderRadius: BorderRadius.circular(layout.rmd),
                      ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  itemCount: 2,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.9,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
