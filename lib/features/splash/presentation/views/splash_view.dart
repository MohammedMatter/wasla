import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wasla/core/constants/app_assest.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/utils/screen_size.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      FirebaseAuth auth = FirebaseAuth.instance;
      final user = auth.currentUser;

      if (user == null) {
        if (!mounted) return;
        GoRouter.of(context).pushNamed(AppRouter.onboardingView);
      } else {
        await Future.delayed(const Duration(seconds: 3));

        if (!mounted) return;

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
        ),
      ),
    );
  }
}
