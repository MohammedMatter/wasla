import 'package:flutter/material.dart';
import 'package:wasla/features/pharmacies/domain/entities/pharmacy.dart';
import 'package:wasla/features/pharmacies/domain/use_cases/fetch_productsBy_pharmacyId_use_case.dart';
import 'package:wasla/features/pharmacies/domain/use_cases/get_all_pharmacies_use_case.dart';
import 'package:wasla/features/products/domain/entities/product.dart';

class PharmacyViewModel extends ChangeNotifier {
  bool isFetching = false;
  List<Pharmacy> pharmacies = [];
  List<Pharmacy> topRatingPharmacies = [];
  List<Product> availableProducts = [];

  final Map<String, List<Product>> _cachedProducts = {};
  Pharmacy? selectedPharmacy;
  GetAllPharmaciesUseCase getAllPharmaciesUseCase;
  FetchProductsbyPharmacyidUseCase fetchProductsbyPharmacyidUseCase;
  PharmacyViewModel({
    required this.getAllPharmaciesUseCase,
    required this.fetchProductsbyPharmacyidUseCase,
  });

  Future<void> getAllPharmacies() async {
    isFetching = true;
    notifyListeners();
    pharmacies = await getAllPharmaciesUseCase.call();
    topRatingPharmacies = [...pharmacies]
      ..sort((a, b) => b.rating.compareTo(a.rating));

    topRatingPharmacies = topRatingPharmacies.take(3).toList();
    isFetching = false;
    notifyListeners();
  }

  selectPharmacy({required Pharmacy pharmacy}) {
    selectedPharmacy = pharmacy;
    notifyListeners();
  }

  List<Product> getFilteredProductsByPharmacy({required String query}) {
    final List<Product> filteredProductsList;
    if (query.isEmpty) {
      filteredProductsList = availableProducts;
      return filteredProductsList;
    }
    filteredProductsList =
        availableProducts
            .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return filteredProductsList;
  }

  List<Pharmacy> getFilteredPharmacies({required String query}) {
    final List<Pharmacy> filteredPharmaciesList;
    if (query.isEmpty) {
      filteredPharmaciesList = pharmacies;
      return filteredPharmaciesList;
    }
    filteredPharmaciesList =
        pharmacies
            .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return filteredPharmaciesList;
  }

  Future<void> fetchProductsByPharmacyId({required String pharmacyId}) async {
    if (_cachedProducts.containsKey(pharmacyId)) return;
    availableProducts = await fetchProductsbyPharmacyidUseCase.call(
      pharmacyId: pharmacyId,
    );
    _cachedProducts[pharmacyId] = availableProducts;
    notifyListeners();
  }
}
