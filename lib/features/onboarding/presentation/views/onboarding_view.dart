import 'package:flutter/material.dart';
import 'package:wasla/features/onboarding/presentation/widgets/onboarding_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: OnboardingBody(),
    );
  }
}
