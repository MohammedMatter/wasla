import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/theme_provider.dart';
import 'package:wasla/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:wasla/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:wasla/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:wasla/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:wasla/features/auth/presentation/view_models/vervication_view_model.dart';
import 'package:wasla/firebase_options.dart';

late final AppRouter appRouter;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  appRouter = AppRouter();
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
            ChangeNotifierProvider(
              create:
                  (context) => AuthViewModel(
                    signInUseCase: SignInUseCase(),
                    signOutUseCase: SignOutUseCase(),
                    signUpUseCase: SignUpUseCase(),
                  ),
            ),
            ChangeNotifierProvider(create: (context) => ThemeProvider()),
            ChangeNotifierProvider(create: (context) => VervicationViewModel()),
          ],
          child: MaterialApp.router(
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                actionsPadding: EdgeInsets.only(right: layout.md),
                actionsIconTheme: IconThemeData(
                  color: AppColors.lightPrimaryColor,
                  size: layout.fontXLarge * 1.52,
                ),
                elevation: 1.1,

                centerTitle: true,
                surfaceTintColor: Colors.transparent,
                shadowColor: Colors.black.withOpacity(0.4),
                backgroundColor: Colors.white,
              ),
              scaffoldBackgroundColor: AppColors.lightBackgroundColor,
            ),
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter.routers,
          ),
        );
      },
    );
  }
}
