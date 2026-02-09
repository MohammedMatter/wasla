import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:wasla/features/products/domain/entities/product.dart';
import 'package:wasla/features/products/domain/entities/product_filter_type.dart';
import 'package:wasla/features/products/domain/use_cases/get_all_products_use_case.dart';

class ProductViewModel extends ChangeNotifier {
  List<Product> allProducts = [];
  List<Product> hairCareProducts = [];
  List<Product> skinCareProducts = [];
  List<Product> babyCareProducts = [];
  List<Product> medicalSuppliesProducts = [];
  List<Product> motherCareProducts = [];
  List<Product> oralAndDentalCareProducts = [];
  List<Product> selectedProductsList = [];
  List<Product> filteredProductsList = [];
  List<Product> filteredCategoryProductsList = [];
  List<Product> popularProducts = [];
  List<Product> relatedProducts = [];
  List<Product> bestSellersProducts = [];
  List<Product> topRatedProducts = [];
  List<Product> favoritesProduct = [];
  final Set<String> _favoriteIds = {};
  String selectedCategory = '';
  Product? selectedProduct;
  GetAllProductsUseCase getAllProductsUseCase;
  ProductViewModel({required this.getAllProductsUseCase});

  Future<void> getAllProducts() async {
    allProducts = await getAllProductsUseCase.call();
    filteredProductsList = allProducts;
    hairCareProducts =
        allProducts.where((p) => p.category == 'hair_care').toList();
    skinCareProducts =
        allProducts.where((p) => p.category == 'skin_care').toList();
    babyCareProducts =
        allProducts.where((p) => p.category == 'baby_care').toList();
    medicalSuppliesProducts =
        allProducts.where((p) => p.category == 'medical_supplies').toList();
    motherCareProducts =
        allProducts.where((p) => p.category == 'mother_care').toList();
    oralAndDentalCareProducts =
        allProducts.where((p) => p.category == 'oral_care').toList();
    topRatedProducts = allProducts.where((p) => p.rating > 4.7).toList();
    popularProducts =
        allProducts
            .where((p) => double.parse(p.price.split(' ')[0]) > 20)
            .toList();
    bestSellersProducts =
        allProducts
            .where((p) => double.parse(p.price.split(' ')[0]) < 25)
            .toList();
    notifyListeners();
  }

  void selectFiltredProducts({required ProductFilterType type}) {
    filteredProductsList = switch (type) {
      ProductFilterType.all => allProducts,
      ProductFilterType.bestSellers => bestSellersProducts,
      ProductFilterType.popular => popularProducts,
      ProductFilterType.topRated => topRatedProducts,
    };
    notifyListeners();
  }

  List<Product> getFilteredProductsByCategory({required String query}) {
    filteredCategoryProductsList =
        selectedProductsList
            .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return filteredCategoryProductsList;
  }

  void selectProductCategory({required String productCategory}) {
    selectedCategory = productCategory;
    switch (productCategory) {
      case 'العناية بالأم':
        selectedProductsList = motherCareProducts;

      case 'العناية بالشعر':
        selectedProductsList = hairCareProducts;

      case 'العناية بالطفل':
        selectedProductsList = babyCareProducts;

      case 'الفم والأسنان':
        selectedProductsList = oralAndDentalCareProducts;

      case 'مستلزمات طبية':
        selectedProductsList = medicalSuppliesProducts;

      case 'العناية بالبشرة':
        selectedProductsList = skinCareProducts;

        filteredCategoryProductsList = selectedProductsList;
    }

    notifyListeners();
  }

  void toggleFavorite(Product product) {
    if (_favoriteIds.contains(product.name)) {
      _favoriteIds.remove(product.name);

      favoritesProduct.removeWhere((p) => p.name == product.name);
    } else {
      _favoriteIds.add(product.name);
      favoritesProduct.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(String productId) {
    return _favoriteIds.contains(productId);
  }

  void selectProduct({required Product product}) {
    selectedProduct = product;
    notifyListeners();
  }

  void selectRelatedProducts({required Product product}) {
    relatedProducts =
        allProducts.where((p) => p.category == product.category).toList();
    log(relatedProducts.toString());
    notifyListeners();
  }
}
