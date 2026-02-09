import 'package:wasla/features/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:wasla/features/onboarding/data/models/onboardingModel.dart';
import 'package:wasla/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource localDataSource;
  OnboardingRepositoryImpl(this.localDataSource);
  @override
  List<OnboardingModel> getOnboardingPages() {
    return localDataSource.getOnboardingData();
  }
}
