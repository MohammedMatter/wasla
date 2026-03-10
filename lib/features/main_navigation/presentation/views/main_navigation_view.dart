import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/constants/app_assest.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/features/main_navigation/presentation/widgets/bottom_navigation_bar_widget.dart';

// ignore: must_be_immutable
class MainNavigationView extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainNavigationView({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.read<AppLayout>();

    final bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          isKeyboardVisible
              ? null
              : FloatingActionButton(
                elevation: 5,
                onPressed:
                    GoRouter.of(context).state.path == 'productDetailView'
                        ? () {
                          GoRouter.of(
                            context,
                          ).goNamed(AppRouter.barcodeScannerView);
                        }
                        : null,
                backgroundColor:
                    GoRouter.of(context).state.path == 'productDetailView'
                        ? AppColors.lightPrimaryColor
                        : const Color(0xffAAAAAA),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(layout.rlg * 1.2),
                  child: Image.asset(
                    GoRouter.of(context).state.path == 'productDetailView'
                        ? AppAssest.docIconFilled
                        : AppAssest.docIcon,
                  ),
                ),
              ),

      bottomNavigationBar: BottomNabigationBarWidget(
        navigationShell: navigationShell,
      ),

      body: navigationShell,
    );
  }
}
