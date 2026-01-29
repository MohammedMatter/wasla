import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:wasla/features/auth/presentation/views/forgot_password_view.dart';
import 'package:wasla/features/auth/presentation/views/password_changed_success_view.dart';
import 'package:wasla/features/auth/presentation/views/register_success_view.dart';
import 'package:wasla/features/auth/presentation/views/reset_password_view.dart';
import 'package:wasla/features/auth/presentation/views/sign_in_view.dart';
import 'package:wasla/features/auth/presentation/views/sign_up_view.dart';
import 'package:wasla/features/auth/presentation/views/verification_code_view.dart.dart';

class AppRouter {
  static final String signInView = 'Sign In View';
  static final String signUpView = 'Sign Up View';
  static final String registerSuccessView = 'Register Success View';
  static final String forgotPasswordView = 'Forgot Password View';
  static final String verificationCodeView = 'Verification Code View';
  static final String resetPasswordView = 'Reset Password View';
  static final String passwordChangedSuccessView =
      'Password ChangedSuccess View';
  final GoRouter routers = GoRouter(
    initialLocation: '/signInView',
    routes: [
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
                          begin: Offset(1, 0),
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
        builder: (context, state) => VerificationCodeView(),
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
    ],
  );
}
