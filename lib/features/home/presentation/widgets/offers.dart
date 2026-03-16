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
          padding: EdgeInsets.symmetric(horizontal: layout.md),
          child: Text(
            'العروض و الخصومات',
            style: AppTextStyle.lightHeading1(layout).copyWith(
              fontSize: layout.fontMedium.clamp(16.0, 20.0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: layout.sm),
        Container(
          padding: EdgeInsets.all(layout.sm),
          decoration: BoxDecoration(
            color: AppColors.lightPrimaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(layout.md),
          ),
          height: (ScreenSize.h(context) * 0.16).clamp(160.0, 220.0),
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
                          flex: 3,
                          child: Column(
                            textDirection: TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'عناية لطيفة ببشرتك الدهنية',
                                    style: AppTextStyle.lightBody(
                                      layout,
                                    ).copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: layout.fontSmall,
                                      color: AppColors.lightPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'تنظيف فعّال بدون جفاف،',
                                    style: AppTextStyle.lightBody(
                                      layout,
                                    ).copyWith(
                                      fontSize: layout.fontSmall * 0.95,
                                      color: AppColors.lightPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'و خصومات لفترة محدودة',
                                    style: AppTextStyle.lightBody(
                                      layout,
                                    ).copyWith(
                                      fontSize: layout.fontSmall * 0.8,
                                      color: AppColors.lightPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                height: 38,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: layout.lg,
                                    ),
                                    backgroundColor:
                                        AppColors.lightPrimaryColor,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        layout.rmd,
                                      ),
                                    ),
                                  ),
                                  child: const FittedBox(
                                    child: Text(
                                      'اطلب الآن',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 2,
                          child: SvgPicture.string(
                            AppAssest.offer,
                            fit: BoxFit.contain,
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
                  (context, homeViewModel, child) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.only(right: layout.sm),
                    height: 8,
                    width: homeViewModel.activeIndex == index ? 18 : 8,
                    decoration: BoxDecoration(
                      color:
                          homeViewModel.activeIndex == index
                              ? AppColors.lightPrimaryColor
                              : AppColors.lightPrimaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(layout.rsm),
                    ),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
