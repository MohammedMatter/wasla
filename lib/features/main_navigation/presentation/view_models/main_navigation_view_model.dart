import 'package:flutter/material.dart';

class MainNavigationViewModel extends ChangeNotifier {
  int selectedBottomNavigationBarIndex = 0;
  void selectBottomNavigationBarIndex({required index}) {
    selectedBottomNavigationBarIndex = index;
    notifyListeners();
  }

  void reset() {
    selectedBottomNavigationBarIndex = 0;
    notifyListeners();
  }
}
