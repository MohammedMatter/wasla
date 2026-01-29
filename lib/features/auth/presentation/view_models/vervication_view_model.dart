import 'package:flutter/material.dart';

class VervicationViewModel extends ChangeNotifier {
  bool isFilledColor = false;

  void toogleFilledColor({required bool isFilledColor}) {
    this.isFilledColor = isFilledColor;
    notifyListeners();
  }
}
