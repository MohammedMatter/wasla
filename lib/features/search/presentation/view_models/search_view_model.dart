import 'package:flutter/foundation.dart';
import 'package:wasla/features/products/domain/entities/product.dart';

class SearchViewModel extends ChangeNotifier {
  int selectedIndex = 0;
  String searchQueryPharmacy = '';
  String searchQueryProduct = '';
  void toogleIndex({required int index}) {
    selectedIndex = index;
    notifyListeners();
  }

  void updatePharmacySearchQuery(String query) {
    searchQueryPharmacy = query;
    notifyListeners();
  }

  void updateProductSearchQuery(String query) {
    searchQueryProduct = query;
    notifyListeners();
  }

  List<Product> getSearchAndFilteredProducts(
    String query,
    List<Product> filteredProductsList,
  ) {
    if (query.isEmpty) {
      return filteredProductsList;
    }

    final lowerQuery = query.toLowerCase();

    return filteredProductsList.where((product) {
      final String nameEn = product.name['en']?.toLowerCase() ?? '';
      final String nameAr = product.name['ar']?.toLowerCase() ?? '';

      return nameEn.contains(lowerQuery) || nameAr.contains(lowerQuery);
    }).toList();
  }

  void reset() {
    selectedIndex = 0;
    searchQueryProduct = '';
    searchQueryPharmacy = '';
    notifyListeners();
  }

  void updateSearchQuery(String value) {}
}
