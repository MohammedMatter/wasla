// domain/repositories/onboarding_repository.dart
import 'package:wasla/features/onboarding/data/models/onboardingModel.dart';

abstract class OnboardingRepository {
  List<OnboardingModel> getOnboardingPages();
}
