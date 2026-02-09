import 'package:wasla/features/onboarding/data/models/onboardingModel.dart';

class OnboardingLocalDataSource {
  List<OnboardingModel> getOnboardingData() => [
    OnboardingModel(
      image: 'assets/onboarding/first_onboarding.png',
      title: 'دوائك أقرب مما تتخيل',
      subtitle: 'اطلب أدويتك بسهولة...',
    ),
    OnboardingModel(
      image: 'assets/onboarding/first_onboarding.png',
      title: 'ابحث واطلب بثواني',
      subtitle: '''ابحث بالاسم او ارفع الروشتة وتعرف 
على الأسعار بكل وضوح وسهولة''',
    ),
    OnboardingModel(
      image: 'assets/onboarding/first_onboarding.png',
      title: 'صحتك أولويتنا ',
      subtitle: '''كل احتياجاتك الطبية في تطبيق واحد 
بضمن راحتك واطمئنانك''',
    ),
  ];
}
