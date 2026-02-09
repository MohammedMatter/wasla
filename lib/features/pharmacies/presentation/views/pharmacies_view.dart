import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/home/presentation/widgets/search_home.dart';
import 'package:wasla/features/pharmacies/presentation/view_models/pharmacy_view_model.dart';

class PharmaciesView extends StatelessWidget {
  const PharmaciesView({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('الصيدليات', style: AppTextStyle.lightHeading1(layout)),
        actions: [
          IconButton(
            icon: Icon(
              Icons.arrow_circle_right_outlined,
              color: AppColors.lightPrimaryColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Column(
        children: [
          SearchHome(layout: layout, hintText: 'ابحث عن اي صيدلية'),
          PharmaciesContent(layout: layout),
        ],
      ),
    );
  }
}

class PharmaciesContent extends StatelessWidget {
  const PharmaciesContent({super.key, required this.layout});

  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    return Consumer<PharmacyViewModel>(
      builder:
          (context, pharmacyViewModel, child) => Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: layout.md),
              child: GridView.builder(
                itemCount: pharmacyViewModel.pharmacies.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                  mainAxisSpacing: layout.sm,
                  crossAxisSpacing: layout.md,
                  crossAxisCount: 2,
                ),
                itemBuilder:
                    (context, index) => GestureDetector(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).goNamed(AppRouter.availableProductsView);
                      },

                      child: Column(
                        children: [
                          Expanded(
                            child: Image.network(
                              pharmacyViewModel.pharmacies[index].image,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(layout.sm * 0.8),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.lightPrimaryColor,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(layout.md),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              pharmacyViewModel.pharmacies[index].name,
                              style: AppTextStyle.lightBody(layout).copyWith(
                                color: Colors.white,
                                fontSize: layout.fontMedium * 1.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              ),
            ),
          ),
    );
  }
}
