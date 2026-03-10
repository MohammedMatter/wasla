import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/di/service_locator.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/theme_provider.dart';
import 'package:wasla/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:wasla/features/auth/presentation/view_models/vervication_view_model.dart';
import 'package:wasla/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wasla/features/checkout/presentation/view_models/payment_view_model.dart';
import 'package:wasla/features/home/presentation/view_models/home_view_model.dart';
import 'package:wasla/features/location/presentation/view_models/location_view_model.dart';
import 'package:wasla/features/main_navigation/presentation/view_models/main_navigation_view_model.dart';
import 'package:wasla/features/onboarding/presentation/view_models/onboarding_view_model.dart';
import 'package:wasla/features/pharmacies/presentation/view_models/pharmacy_view_model.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';
import 'package:wasla/features/profile/presentation/view_models/profile_view_model.dart';
import 'package:wasla/features/search/presentation/view_models/search_view_model.dart';
import 'package:wasla/firebase_options.dart';

late final AppRouter appRouter;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  appRouter = AppRouter();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layout = AppLayout.fromWidth(width: constraints.maxWidth);
        return MultiProvider(
          providers: [
            Provider<AppLayout>.value(value: layout),
            ChangeNotifierProvider(create: (context) => sl<AuthViewModel>()),
            ChangeNotifierProvider(create: (context) => ThemeProvider()),
            ChangeNotifierProvider(create: (context) => VervicationViewModel()),
            ChangeNotifierProvider(create: (context) => HomeViewModel()),
            ChangeNotifierProvider(create: (context) => SearchViewModel()),
            ChangeNotifierProvider(create: (context) => CartViewModel()),
            ChangeNotifierProvider(create: (context) => sl<ProfileViewModel>()),
            ChangeNotifierProvider(create: (context) => sl<ProductViewModel>()),
            ChangeNotifierProvider(create: (context) => sl<PaymentViewModel>()),
            ChangeNotifierProvider(
              create: (context) => sl<LocationViewModel>(),
            ),
            ChangeNotifierProvider(
              create: (context) => sl<PharmacyViewModel>(),
            ),
            ChangeNotifierProvider(
              create: (context) => MainNavigationViewModel(),
            ),
            ChangeNotifierProvider(
              create: (context) => sl<OnboardingViewModel>(),
            ),
          ],
          child: MaterialApp.router(
            theme: ThemeData(
              floatingActionButtonTheme: FloatingActionButtonThemeData(),
              appBarTheme: AppBarTheme(
                actionsPadding: EdgeInsets.only(right: layout.md),
                actionsIconTheme: IconThemeData(
                  color: AppColors.lightPrimaryColor,
                  size: layout.fontXLarge * 1.25,
                ),
                elevation: 1.1,

                centerTitle: true,
                surfaceTintColor: Colors.transparent,
                shadowColor: Colors.black.withOpacity(0.4),
                backgroundColor: Colors.white,
              ),
              scaffoldBackgroundColor: AppColors.lightBackgroundColor,
            ),
            debugShowCheckedModeBanner: true,
            routerConfig: appRouter.routers,
          ),
        );
      },
    );
  }
}
