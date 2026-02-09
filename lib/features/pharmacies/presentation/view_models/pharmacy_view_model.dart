// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:wasla/features/pharmacies/domain/entities/pharmacy.dart';
import 'package:wasla/features/pharmacies/domain/use_cases/fetch_productsBy_pharmacyId_use_case.dart';
import 'package:wasla/features/pharmacies/domain/use_cases/get_all_pharmacies_use_case.dart';
import 'package:wasla/features/products/domain/entities/product.dart';

class PharmacyViewModel extends ChangeNotifier {
  List<Pharmacy> pharmacies = [];
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
    pharmacies = await getAllPharmaciesUseCase.call();
    log(pharmacies.toString());
    notifyListeners();
  }

  selectPharmacy({required Pharmacy pharmacy}) {
    selectedPharmacy = pharmacy;
    notifyListeners();
  }

  List<Product> getFilteredProductsByPharmacy({required String query}) {
    final filteredProductsList =
        availableProducts
            .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return filteredProductsList;
  }

  Future<void> fetchProductsByPharmacyId({required String pharmacyId}) async {
    if (_cachedProducts.containsKey(pharmacyId)) return;
    availableProducts = await fetchProductsbyPharmacyidUseCase.call(
      pharmacyId: pharmacyId,
    );

    _cachedProducts[pharmacyId] = availableProducts;
    log('تم جلب بيانات المنتجات من المصدر البعيد');
    notifyListeners();
  }
}
