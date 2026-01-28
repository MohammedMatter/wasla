import 'package:go_router/go_router.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/features/auth/presentation/views/sign_in_view.dart';

class AppRouter {
  static final String signInView = 'Sign In View';
  static final String signUpView = 'Sign Up View';
  final GoRouter routers = GoRouter(
    routes: [
      GoRoute(
        path: '/signInView',
        builder: (context, state) {
          AppLayout layout = state.extra as AppLayout;
          return SignInView(layout: layout);
        },
        name: signInView,
      ),
    ],
  );
}
