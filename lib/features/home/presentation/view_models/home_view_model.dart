import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int activeIndex = 0;
  bool showAllFeaturedProducts = false;
  bool showAllPharmacies = false;

  void toogleActiveIndex(int activeIndex) {
    this.activeIndex = activeIndex;
    notifyListeners();
  }

  void toogleShowAllFeaturedProducts() {
    showAllFeaturedProducts = !showAllFeaturedProducts;
    notifyListeners();
  }

  void toogleShowAllPharmacies() {
    showAllPharmacies = !showAllPharmacies;
    notifyListeners();
  }
}
