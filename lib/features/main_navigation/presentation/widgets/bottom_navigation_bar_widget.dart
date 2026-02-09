import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // أضف هذا
import 'package:wasla/core/theme/app_color.dart';

class BottomNabigationBarWidget extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNabigationBarWidget({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final int currentIndex = navigationShell.currentIndex;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: AnimatedBottomNavigationBar(
          iconSize: 27,
          elevation: 10,
          icons: [
            currentIndex == 0 ? Icons.home : Icons.home_outlined,
            currentIndex == 1
                ? Icons.shopping_cart
                : Icons.shopping_cart_outlined,
            currentIndex == 2 ? Icons.person : Icons.person_outline,
            currentIndex == 3 ? Icons.location_on : Icons.location_on_outlined,
          ],
          activeIndex: currentIndex, // يقرأ من الـ Shell
          gapLocation: GapLocation.center,
          inactiveColor: AppColors.lightPrimaryColor,
          notchSmoothness: NotchSmoothness.softEdge,
          activeColor: AppColors.lightPrimaryColor,
          onTap: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
        ),
      ),
    );
  }
}
