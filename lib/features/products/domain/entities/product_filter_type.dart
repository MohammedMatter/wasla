enum ProductFilterType { all, bestSellers, popular, topRated }

extension ProductFilterExtension on ProductFilterType {
  String get arabicName {
    return switch (this) {
      ProductFilterType.all => 'الكل',
      ProductFilterType.bestSellers => 'الأكثر مبيعاً',
      ProductFilterType.popular => 'الأكثر شهرة',
      ProductFilterType.topRated => 'الأعلى تقييماً',
    };
  }
}
