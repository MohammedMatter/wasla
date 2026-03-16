import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/home/presentation/widgets/home_body.dart';
import 'package:wasla/features/pharmacies/presentation/view_models/pharmacy_view_model.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';
import 'package:wasla/features/profile/presentation/view_models/profile_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final vm = Provider.of<ProductViewModel>(context, listen: false);
      final vm2 = Provider.of<PharmacyViewModel>(context, listen: false);
      await Future.wait([vm.getAllProducts(), vm2.getAllPharmacies()]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.read<AppLayout>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.location_on_outlined,
            color: AppColors.lightPrimaryColor,
            size: layout.fontLarge.clamp(18, 24),
          ),
        ),

        title: Consumer<ProfileViewModel>(
          builder:
              (context, vm, child) => Text(
                'وصلة',
                style: AppTextStyle.lightHeading1(layout).copyWith(
                  fontSize: layout.fontLarge.clamp(18.0, 24.0),
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      body: HomeBody(),
    );
  }
}
