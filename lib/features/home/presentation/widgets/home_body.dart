import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/home/presentation/widgets/featured_products.dart';
import 'package:wasla/features/home/presentation/widgets/grid_categories.dart';
import 'package:wasla/features/home/presentation/widgets/offers.dart';
import 'package:wasla/features/home/presentation/widgets/pharmacies_section.dart';
import 'package:wasla/features/home/presentation/widgets/search_home.dart';
import 'package:wasla/features/home/presentation/widgets/shimmer_home_effect.dart';
import 'package:wasla/features/pharmacies/presentation/view_models/pharmacy_view_model.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key});
  final List<String> categories = [
    'العناية بالطفل',
    'العناية بالأم',
    'الفم والأسنان',
    'العناية بالشعر',
    'العناية بالبشرة',
    'مستلزمات طبية',
  ];

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.read<AppLayout>();
    return Consumer2<ProductViewModel, PharmacyViewModel>(
      builder: (context, productViewModel, pharmacytViewModel, child) {
        bool onData =
            pharmacytViewModel.pharmacies.isEmpty &&
            productViewModel.allProducts.isEmpty;
        bool loading =
            productViewModel.isFetching || pharmacytViewModel.isFetching;
        return RefreshIndicator(
          color: AppColors.lightPrimaryColor,
          onRefresh: () async {
            await Future.wait([
              productViewModel.getAllProducts(),
              pharmacytViewModel.getAllPharmacies(),
            ]);
          },
          child: AnimatedSwitcher(
            duration: Duration(seconds: 2),
            child: _buildCurrentState(loading, onData, layout),
          ),
        );
      },
    );
  }

  Widget _buildCurrentState(bool loading, bool onData, AppLayout layout) {
    if (loading) {
      return SingleChildScrollView(child: ShimmerHomeEffect(layout: layout));
    } else if (onData && !loading) {
      return Center(
        child: Text(
          ' ! لا يوجد بيانات',
          style: AppTextStyle.lightHeading1(layout),
        ),
      );
    }

    return Column(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchHome(layout: layout, hintText: 'ابحث عن المنتج الذي تريده'),
        Expanded(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                GridCategories(categories: categories),
                SizedBox(height: layout.xl),
                const Offers(),
                SizedBox(height: layout.md),
                const FeaturedProducts(),
                SizedBox(height: layout.md),
                const PharmaciesSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
