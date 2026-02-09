import 'package:flutter/foundation.dart';
import 'package:wasla/features/products/domain/entities/product.dart';

class SearchViewModel extends ChangeNotifier {
  int selectedIndex = 0;
  String searchQuery = '';
  void toogleIndex({required int index}) {
    selectedIndex = index;
    notifyListeners();
  }

  void updateSearchQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }

  List<Product> getSearchAndFilteredProducts(
    String query,
    List<Product> filteredProductsList,
  ) {
    if (query.isEmpty) {
      return filteredProductsList;
    }
    return filteredProductsList.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  void reset() {
    selectedIndex = 0;
    searchQuery = '';
    notifyListeners();
  }
}
