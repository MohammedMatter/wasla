import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:wasla/features/auth/presentation/views/forgot_password_view.dart';
import 'package:wasla/features/auth/presentation/views/password_changed_success_view.dart';
import 'package:wasla/features/auth/presentation/views/register_success_view.dart';
import 'package:wasla/features/auth/presentation/views/reset_password_view.dart';
import 'package:wasla/features/auth/presentation/views/sign_in_view.dart';
import 'package:wasla/features/auth/presentation/views/sign_up_view.dart';
import 'package:wasla/features/auth/presentation/views/verification_code_view.dart.dart';
import 'package:wasla/features/auth/presentation/views/welcome_view.dart';
import 'package:wasla/features/cart/presentation/views/cart_view.dart';
import 'package:wasla/features/checkout/presentation/views/address_view.dart';
import 'package:wasla/features/checkout/presentation/views/payment_method_view.dart';
import 'package:wasla/features/checkout/presentation/views/payment_through_BOP_view.dart';
import 'package:wasla/features/favorites/presentation/views/favorites_view.dart';
import 'package:wasla/features/home/presentation/views/home_view.dart';
import 'package:wasla/features/location/presentation/views/location_view.dart';
import 'package:wasla/features/main_navigation/presentation/views/main_navigation_view.dart';
import 'package:wasla/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:wasla/features/pharmacies/presentation/views/pharmacies_view.dart';
import 'package:wasla/features/products/presentation/views/available_products_view.dart';
import 'package:wasla/features/products/presentation/views/category_products_view.dart';
import 'package:wasla/features/products/presentation/views/product_details_view.dart';
import 'package:wasla/features/profile/presentation/views/profile_view.dart';
import 'package:wasla/features/scanner/views/barcode_scanner_view.dart';
import 'package:wasla/features/search/presentation/views/search_view.dart';
import 'package:wasla/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static final String splashView = 'Splash View';
  static final String welcomeView = 'Welcome View';
  static final String signInView = 'Sign In View';
  static final String signUpView = 'Sign Up View';
  static final String homeView = 'Home View';
  static final String searchView = 'Search View';
  static final String cartView = 'Cart View';
  static final String addressView = 'Address View';
  static final String paymentMethodView = 'Payment Method View';
  static final String paymentThroughBopView = 'Payment Through BopView';
  static final String registerSuccessView = 'Register Success View';
  static final String forgotPasswordView = 'Forgot Password View';
  static final String verificationCodeView = 'Verification Code View';
  static final String resetPasswordView = 'Reset Password View';
  static final String productDetailView = 'Product Detail View';
  static final String pharmaciesView = 'Pharmacies View';
  static final String onboardingView = 'Onboarding View';
  static final String availableProductsView = 'Available Products View';
  static final String mainNavigationView = 'Main Navigation View';
  static final String categoryProductsView = 'Category Products View';
  static final String profileView = 'Profile View';
  static final String locationView = 'Location View';
  static final String favoritesView = 'Favorites View';
  static final String barcodeScannerView = 'Barcode Scanner View';
  static final String passwordChangedSuccessView =
      'Password ChangedSuccess View';
  final GoRouter routers = GoRouter(
    initialLocation: '/splashView',

    routes: [
      StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/homeView',
                builder: (context, state) => HomeView(),
                name: homeView,
                routes: [
                  GoRoute(
                    path: 'searchView',
                    builder: (context, state) => SearchView(),
                    name: searchView,
                  ),
                  GoRoute(
                    path: 'productDetailView',
                    builder: (context, state) => ProductDetailView(),
                    name: productDetailView,
                  ),
                  GoRoute(
                    path: 'categoryProductsView',
                    builder: (context, state) => CategoryProductsView(),
                    name: categoryProductsView,
                  ),
                  GoRoute(
                    path: 'pharmaciesView',
                    builder: (context, state) => PharmaciesView(),
                    name: pharmaciesView,
                  ),
                  GoRoute(
                    path: 'availableProductsView',
                    builder: (context, state) => AvailableProductsView(),
                    name: availableProductsView,
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/cartView',
                builder: (context, state) => CartView(),
                name: cartView,
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/locationView',
                builder: (context, state) => LocationView(),
                name: locationView,
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profileView',
                builder: (context, state) => ProfileView(),
                name: profileView,
                routes: [
                  GoRoute(
                    path: 'favoritesView',
                    builder: (context, state) => FavoritesView(),
                    name: favoritesView,
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/barcodeScannerView',
                builder: (context, state) => BarcodeScannerView(),
                name: barcodeScannerView,
              ),
            ],
          ),
        ],
        builder:
            (context, state, navigationShell) =>
                MainNavigationView(navigationShell: navigationShell),
      ),

      GoRoute(
        path: '/splashView',
        builder: (context, state) => SplashView(),
        name: splashView,
      ),
      GoRoute(
        path: '/onboardingView',
        pageBuilder:
            (context, state) => CustomTransitionPage(
              transitionDuration: Duration(milliseconds: 600),
              child: OnboardingView(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(0, 1),
                          end: Offset.zero,
                        ).animate(
                          CurvedAnimation(
                            curve: Curves.decelerate,
                            parent: animation,
                          ),
                        ),
                        child: child,
                      ),
            ),
        name: onboardingView,
      ),
      GoRoute(
        path: '/welcomeView',
        pageBuilder:
            (context, state) => CustomTransitionPage(
              transitionDuration: Duration(milliseconds: 600),
              child: WelcomeView(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(-1, 0),
                          end: Offset.zero,
                        ).animate(
                          CurvedAnimation(
                            curve: Curves.decelerate,
                            parent: animation,
                          ),
                        ),
                        child: child,
                      ),
            ),
        name: welcomeView,
      ),
      GoRoute(
        path: '/signInView',
        builder: (context, state) => SignInView(),
        name: signInView,
      ),
      GoRoute(
        path: '/signUpView',
        builder: (context, state) => SignUpView(),
        name: signUpView,
      ),
      GoRoute(
        path: '/registerSuccessView',
        name: registerSuccessView,
        pageBuilder:
            (context, state) => CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 600),
              key: state.pageKey,
              child: RegisterSuccessView(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      SlideTransition(
                        position: Tween(
                          begin: Offset(0, 1),
                          end: Offset.zero,
                        ).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeOutQuart,
                          ),
                        ),
                        child: child,
                      ),
            ),
      ),
      GoRoute(
        path: '/forgotPasswordView',
        builder: (context, state) => ForgotPasswordView(),
        name: forgotPasswordView,
      ),
      GoRoute(
        path: '/verificationCodeView',
        pageBuilder: (context, state) {
          final String otpCode = state.extra!.toString();

          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: VerificationCodeView(otpCode: otpCode),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                      position: Tween(
                        begin: Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOutQuart,
                        ),
                      ),
                      child: child,
                    ),
          );
        },
        name: verificationCodeView,
      ),
      GoRoute(
        path: '/resetPasswordView',
        builder: (context, state) => ResetPasswordView(),
        name: resetPasswordView,
      ),
      GoRoute(
        path: '/passwordChangedSuccessView',
        builder: (context, state) => PasswordChangedSuccessView(),
        name: passwordChangedSuccessView,
      ),

      GoRoute(
        path: '/addressView',
        builder: (context, state) => AddressView(),
        name: addressView,
      ),
      GoRoute(
        path: '/paymentMethodView',
        builder: (context, state) => PaymentMethodView(),
        name: paymentMethodView,
      ),
      GoRoute(
        path: '/paymentThroughBopView',
        builder: (context, state) => PaymentThroughBopView(),
        name: paymentThroughBopView,
      ),
    ],
  );
}
