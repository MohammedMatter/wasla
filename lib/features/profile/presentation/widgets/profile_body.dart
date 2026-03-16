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
import 'package:wasla/features/profile/presentation/widgets/menu_item.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.read<AppLayout>();
    return Consumer<ProfileViewModel>(
      builder:
          (context, profileViewModel, child) => SafeArea(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: layout.md,
                    vertical: layout.md,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: layout.xl,
                            backgroundColor: AppColors.lightPrimaryColor,
                            backgroundImage: const NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkliIuVgejvDwavQJbzUFo2z99ptt-UGB43w&s',
                            ),
                          ),
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
                                    fontSize: layout.fontMedium,
                                  ),
                                ),
                                Text(
                                  profileViewModel.currentUser?.email ??
                                      'البريد الإلكتروني',
                                  style: AppTextStyle.lightBody(
                                    layout,
                                  ).copyWith(
                                    color: Colors.grey,
                                    fontSize: layout.fontSmall,
                                  ),

                                  textDirection: TextDirection.ltr,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: layout.sm),
                          Icon(
                            Icons.manage_accounts_outlined,
                            color: AppColors.lightPrimaryColor,
                          ),
                        ],
                      ),

                      SizedBox(height: layout.md),
                      Consumer<ProductViewModel>(
                        builder:
                            (context, productViewModel, child) => MenuItem(
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
                      MenuItem(
                        title: 'بيانات الإتصال',
                        icon: Icons.contact_phone_outlined,
                        iconColor: AppColors.lightPrimaryColor,
                        onTap: () {},
                      ),
                      MenuItem(
                        title: 'الإعدادات',
                        icon: Icons.settings_outlined,
                        iconColor: AppColors.lightPrimaryColor,
                        onTap: () {},
                      ),
                      MenuItem(
                        title: 'تسجيل خروج',
                        icon: Icons.logout,
                        iconColor: Colors.red,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => LogoutDialog(layout: layout),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
