// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:wasla/features/onboarding/data/models/onboardingModel.dart';

import 'package:wasla/features/onboarding/domain/use_cases.dart/get_onboarding_data_use_case.dart';

class OnboardingViewModel extends ChangeNotifier {
  List<OnboardingModel> onboardingData = [];
  int tabIndex = 0;
  GetOnboardingDataUseCase getOnboardingDataUseCase;
  OnboardingViewModel({required this.getOnboardingDataUseCase}) {
    getOnboardingData();
  }

  void getOnboardingData() {
    onboardingData = getOnboardingDataUseCase.call();
    notifyListeners();
  }

  void toogleTab() {
    if (tabIndex < onboardingData.length - 1) {
      tabIndex++;
    }

    notifyListeners();
  }
}
