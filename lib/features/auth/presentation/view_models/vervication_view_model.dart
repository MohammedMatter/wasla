import 'dart:async';
import 'package:flutter/material.dart';

class VervicationViewModel extends ChangeNotifier {
  bool isFilledColor = false;
  bool canResend = false;
  int start = 60;
  String? _userEmail;
  String? get userEmail => _userEmail;

  void toogleFilledColor({required bool isFilledColor}) {
    this.isFilledColor = isFilledColor;
    notifyListeners();
  }

  void setUserEmail(String email) {
    _userEmail = email;
    notifyListeners();
  }

  void startTimer() async {
    start = 60;
    canResend = false;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (start == 0) {
        timer.cancel();
        canResend = true;
      } else {
        start--;
      }
      notifyListeners();
    });
  }
}
