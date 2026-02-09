import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/constants/app_assest.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/utils/screen_size.dart';
import 'package:wasla/features/home/presentation/view_models/home_view_model.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.read<AppLayout>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.rtl,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.lg),
          child: Text(
            'العروض و الخصومات',
            style: AppTextStyle.lightHeading1(
              layout,
            ).copyWith(fontSize: layout.fontLarge),
          ),
        ),
        SizedBox(height: layout.md),
        Container(
          decoration: BoxDecoration(
            color: AppColors.lightPrimaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(layout.md),
          ),
          height: ScreenSize.w(context) * 0.27,
          margin: EdgeInsets.symmetric(horizontal: layout.md),
          child: Consumer<HomeViewModel>(
            builder:
                (context, homeViewModel, child) => PageView.builder(
                  itemCount: 3,
                  reverse: true,
                  onPageChanged:
                      (value) => homeViewModel.toogleActiveIndex(value),
                  itemBuilder: (context, index) {
                    return Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            textDirection: TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'عناية لطيفة ببشرتك الدهنية',
                                style: AppTextStyle.lightBody(layout).copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: layout.fontMedium * 1.4,
                                  color: AppColors.lightPrimaryColor,
                                ),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'تنظيف فعّال بدون جفاف،   ',
                                style: AppTextStyle.lightBody(layout).copyWith(
                                  fontSize: layout.fontMedium * 1.1,
                                  color: AppColors.lightPrimaryColor,
                                ),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'و خصومات لفترة محدودة',
                                style: AppTextStyle.lightBody(layout).copyWith(
                                  fontSize: layout.fontMedium * 0.89,
                                  color: AppColors.lightPrimaryColor,
                                ),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: layout.sm),
                              SizedBox(
                                height: layout.xl,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: layout.xl,
                                    ),
                                    overlayColor: Colors.transparent,
                                    backgroundColor:
                                        AppColors.lightPrimaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        layout.rmd,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'اطلب الآن',
                                    style: AppTextStyle.lightSubtitle(
                                      layout,
                                    ).copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Container(
                            // color: Colors.amber,
                            child: SvgPicture.string(
                              AppAssest.offer,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
          ),
        ),
        SizedBox(height: layout.md),
        Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => Consumer<HomeViewModel>(
              builder:
                  (context, homeViewModel, child) => Padding(
                    padding: EdgeInsets.only(right: layout.sm),
                    child: CircleAvatar(
                      backgroundColor:
                          homeViewModel.activeIndex == index
                              ? AppColors.lightPrimaryColor
                              : AppColors.lightPrimaryColor.withOpacity(0.4),
                      radius: layout.rsm,
                    ),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
