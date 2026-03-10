import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/features/pharmacies/presentation/view_models/pharmacy_view_model.dart';
import 'package:wasla/features/products/presentation/widgets/product_item.dart';
import 'package:wasla/features/search/presentation/view_models/search_view_model.dart';

class AvailableProducts extends StatelessWidget {
  const AvailableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Consumer2<PharmacyViewModel, SearchViewModel>(
      builder: (context, pharmacyViewModel, searchViewModel, child) {
        final filteredList = pharmacyViewModel.getFilteredProductsByPharmacy(
          query: searchViewModel.searchQueryProduct,
        );
        return Expanded(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredList.length,
              itemBuilder:
                  (context, index) => ProductItem(
                    layout: layout,
                    index: index,
                    products: filteredList,
                  ),
            ),
          ),
        );
      },
    );
  }
}
