import 'package:wasla/core/constants/lang_keys.dart';
import 'package:wasla/features/onboarding/data/models/onboardingModel.dart';

class OnboardingLocalDataSource {
  List<OnboardingModel> getOnboardingData() => [
    OnboardingModel(
      image: 'assets/onboarding/first_onboarding.png',
      title: LangKeys.onboardingTitle1,
      subtitle: LangKeys.onboardingSubtitle1,
    ),
    OnboardingModel(
      image: 'assets/onboarding/second_onboarding.png',
      title: LangKeys.onboardingTitle2,
      subtitle: LangKeys.onboardingSubtitle2,
    ),
    OnboardingModel(
      image: 'assets/onboarding/third_onboarding.png',
      title: LangKeys.onboardingTitle3,
      subtitle: LangKeys.onboardingSubtitle3,
    ),
  ];
}
