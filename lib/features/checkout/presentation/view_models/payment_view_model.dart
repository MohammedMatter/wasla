import 'package:flutter/foundation.dart';

class PaymentViewModel extends ChangeNotifier {
  bool isRedirectedToBank = false;
  bool paymentCompleted = false;
  bool isCancelled = false;
  int selectedPaymentMethodIndex = 0;
  int selectedPaymentMethodViaBopIndex = 0;
  int steppterIndex = 0;
  List doneStepper = [0];

  void redirectToBank() {
    isRedirectedToBank = true;
    notifyListeners();
  }

  void updatePaymentStatus() {
    paymentCompleted = true;
    notifyListeners();
  }

  Future<void> startPaymentFlow() async {
    isCancelled = false;
    notifyListeners();
    redirectToBank();
    await Future.delayed(const Duration(seconds: 3));
    if (!isCancelled) {
      setStepperIndex(index: 2);
      updatePaymentStatus();
    }
    notifyListeners();
  }

  void setStepperIndex({required int index}) {
    steppterIndex = index;
    notifyListeners();
  }

  void selectPaymentMethod(int index) {
    selectedPaymentMethodIndex = index;
    notifyListeners();
  }

  void selectPaymentViaBopMethod(int index) {
    selectedPaymentMethodViaBopIndex = index;
    notifyListeners();
  }

  void cancelPaymentProcess() {
    isCancelled = true;
    isRedirectedToBank = false;
    notifyListeners();
  }

  void reset() {
    isRedirectedToBank = false;
    paymentCompleted = false;
    steppterIndex = 0;
    notifyListeners();
  }
}
