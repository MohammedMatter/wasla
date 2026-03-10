import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/onboarding/presentation/view_models/onboarding_view_model.dart';

class HeaderOnboardingSection extends StatelessWidget {
  const HeaderOnboardingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Consumer<OnboardingViewModel>(
      builder:
          (context, onboardingVm, child) => Column(
            children: [
              Expanded(
                flex: 4,
                child: Center(
                  child: Image.asset(
                    onboardingVm.onboardingData[onboardingVm.tabIndex].image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              SizedBox(height: layout.lg),

              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingVm.onboardingData.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    margin: EdgeInsets.symmetric(horizontal: layout.xs),
                    height: layout.sm,
                    width:
                        onboardingVm.tabIndex == index ? layout.xl : layout.sm,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(layout.lg),
                      color:
                          onboardingVm.tabIndex == index
                              ? AppColors.lightPrimaryColor
                              : AppColors.lightPrimaryColor.withOpacity(0.2),
                    ),
                  ),
                ),
              ),

              SizedBox(height: layout.xl),

              Column(
                children: [
                  Text(
                    onboardingVm.onboardingData[onboardingVm.tabIndex].title,
                    style: AppTextStyle.lightBody(
                      layout,
                    ).copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: layout.md),
                  Text(
                    onboardingVm.onboardingData[onboardingVm.tabIndex].subtitle,
                    style: AppTextStyle.lightSubtitle(
                      layout,
                    ).copyWith(fontSize: layout.fontMedium * 1.1),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
    );
  }
}
