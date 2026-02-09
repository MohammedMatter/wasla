import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';
import 'package:wasla/features/profile/presentation/view_models/profile_view_model.dart';
import 'package:wasla/features/profile/presentation/widgets/logout_dialog.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.read<AppLayout>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Consumer<ProfileViewModel>(
          builder:
              (context, vm, child) => Text(
                'الملف الشخصي',
                style: AppTextStyle.lightHeading1(layout),
              ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Consumer<ProfileViewModel>(
        builder:
            (context, profileViewModel, child) => SafeArea(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: layout.lg,
                      vertical: layout.xl,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // CircleAvatar(
                            //   radius: layout.xl * 1.4,
                            //   backgroundColor: AppColors.lightPrimaryColor,
                            //   backgroundImage: const NetworkImage(
                            //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkliIuVgejvDwavQJbzUFo2z99ptt-UGB43w&s',
                            //   ),
                            // ),
                            SizedBox(width: layout.md),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    profileViewModel.currentUser?.name ??
                                        'اسم المستخدم',
                                    style: AppTextStyle.lightHeading2(
                                      layout,
                                    ).copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    profileViewModel.currentUser?.email ??
                                        'البريد الإلكتروني',
                                    style: AppTextStyle.lightBody(
                                      layout,
                                    ).copyWith(
                                      color: Colors.grey,
                                      fontSize: layout.fontMedium * 1.1,
                                    ),

                                    textDirection: TextDirection.ltr,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: layout.md),
                            Icon(
                              Icons.manage_accounts_outlined,
                              color: AppColors.lightPrimaryColor,
                              size: layout.fontXLarge,
                            ),
                          ],
                        ),

                        SizedBox(height: layout.xl),
                        Consumer<ProductViewModel>(
                          builder:
                              (context, productViewModel, child) =>
                                  _buildMenuItem(
                                    layout: layout,
                                    title: 'المفضلة',
                                    icon: Icons.favorite_border,
                                    iconColor: AppColors.lightPrimaryColor,
                                    onTap: () {
                                      GoRouter.of(
                                        context,
                                      ).goNamed(AppRouter.favoritesView);
                                    },
                                  ),
                        ),
                        _buildMenuItem(
                          layout: layout,
                          title: 'بيانات الإتصال',
                          icon: Icons.contact_phone_outlined,
                          iconColor: AppColors.lightPrimaryColor,
                          onTap: () {},
                        ),
                        _buildMenuItem(
                          layout: layout,
                          title: 'الإعدادات',
                          icon: Icons.settings_outlined,
                          iconColor: AppColors.lightPrimaryColor,
                          onTap: () {},
                        ),
                        _buildMenuItem(
                          layout: layout,
                          title: 'تسجيل خروج',
                          icon: Icons.logout,
                          iconColor: Colors.red,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => LogoutDialog(layout: layout),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }

  Widget _buildMenuItem({
    required AppLayout layout,
    required String title,
    required IconData icon,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: () => onTap(),
      contentPadding: EdgeInsets.symmetric(vertical: layout.xs),
      title: Text(
        title,
        style: AppTextStyle.lightBody(
          layout,
        ).copyWith(color: Colors.grey[700], fontWeight: FontWeight.w500),
      ),
      leading: Icon(icon, color: iconColor, size: layout.fontXLarge * 0.84),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: layout.fontXLarge,
        color: AppColors.lightPrimaryColor,
      ),
    );
  }
}
