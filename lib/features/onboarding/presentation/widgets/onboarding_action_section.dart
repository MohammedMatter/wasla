import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/constants/lang_keys.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';
import 'package:wasla/features/onboarding/presentation/view_models/onboarding_view_model.dart';

class OnboardingActionSection extends StatelessWidget {
  const OnboardingActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();

    return Consumer<OnboardingViewModel>(
      builder: (context, onboardingVm, child) {
        final isLastPage =
            onboardingVm.tabIndex == onboardingVm.onboardingData.length - 1;

        return Row(
          children: [
            Expanded(
              child: CustomElevatedButtonWidget(
                onPressed: () {
                  if (isLastPage) {
                    GoRouter.of(context).pushNamed(AppRouter.welcomeView);
                  } else {
                    onboardingVm.toogleTab();
                  }
                },
                title:
                    isLastPage
                        ? LangKeys.onboardingStart.tr()
                        : LangKeys.onboardingNext.tr(),
              ),
            ),

            if (!isLastPage) ...[
              SizedBox(width: layout.md),
              Expanded(
                child: CustomElevatedButtonWidget(
                  isFilled: false,
                  onPressed: () {
                    GoRouter.of(context).pushNamed(AppRouter.signInView);
                  },
                  title: LangKeys.onboardingSkip.tr(),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
