import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/features/onboarding/presentation/widgets/onboarding_action_section.dart';
import 'package:wasla/features/onboarding/presentation/widgets/header_onboarding_section.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Padding(
      padding: EdgeInsets.all(layout.xl),
      child: Column(
        children: [
          const Expanded(child: HeaderOnboardingSection()),

          const Expanded(child: OnboardingActionSection()),
        ],
      ),
    );
  }
}
