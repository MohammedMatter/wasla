import 'package:wasla/features/onboarding/data/models/onboardingModel.dart';
import 'package:wasla/features/onboarding/domain/repositories/onboarding_repository.dart';

class GetOnboardingDataUseCase {
  final OnboardingRepository repository;
  GetOnboardingDataUseCase(this.repository);

  List<OnboardingModel> call() {
    return repository.getOnboardingPages();
  }
}
