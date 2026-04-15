import 'package:easy_localization/easy_localization.dart';
import 'package:wasla/core/constants/lang_keys.dart';

enum ProductFilterType { all, bestSellers, popular, topRated }

extension ProductFilterExtension on ProductFilterType {
  String get name {
    return switch (this) {
      ProductFilterType.all => LangKeys.filterAll.tr(),
      ProductFilterType.bestSellers => LangKeys.filterBestSellers.tr(),
      ProductFilterType.popular => LangKeys.filterPopular.tr(),
      ProductFilterType.topRated => LangKeys.filterTopRated.tr(),
    };
  }
}
