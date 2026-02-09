import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/constants/app_assest.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/utils/screen_size.dart';
import 'package:wasla/features/pharmacies/presentation/view_models/pharmacy_view_model.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      FirebaseAuth auth = FirebaseAuth.instance;
      final user = auth.currentUser;
      final vm = Provider.of<ProductViewModel>(context, listen: false);
      final vm2 = Provider.of<PharmacyViewModel>(context, listen: false);
      await vm.getAllProducts();
      await vm2.getAllPharmacies();
      if (user == null) {
        GoRouter.of(context).pushNamed(AppRouter.onboardingView);
      } else {
        GoRouter.of(context).goNamed(AppRouter.homeView);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.string(
          AppAssest.logo,
          width: ScreenSize.w(context) * 0.38,
          // height: ScreenSize.h(context) * 0.4,
        ),
      ),
    );
  }
}
