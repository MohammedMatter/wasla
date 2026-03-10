import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/auth/presentation/view_models/auth_view_model.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key, required this.layout});
  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder:
          (context, authViewModel, child) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(layout.md),
            ),
            child: Padding(
              padding: EdgeInsets.all(layout.lg),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(layout.md),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.logout,
                          color: Colors.red,
                          size: layout.fontXLarge * 1.5,
                        ),
                      ),
                      SizedBox(height: layout.md),
                      Text(
                        'تسجيل الخروج',
                        style: AppTextStyle.lightHeading2(
                          layout,
                        ).copyWith(color: Colors.black),
                      ),
                      SizedBox(height: layout.sm),
                      Text(
                        'هل أنت متأكد أنك تريد مغادرة التطبيق؟',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.lightBody(
                          layout,
                        ).copyWith(color: Colors.grey),
                      ),
                      SizedBox(height: layout.xl),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  color: AppColors.lightPrimaryColor,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    layout.sm,
                                  ),
                                ),
                              ),
                              onPressed:
                                  authViewModel.isSignout
                                      ? null
                                      : () => Navigator.pop(context),
                              child: Text(
                                'إلغاء',
                                style: AppTextStyle.lightSubtitle(
                                  layout,
                                ).copyWith(color: AppColors.lightPrimaryColor),
                              ),
                            ),
                          ),
                          SizedBox(width: layout.md),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    layout.sm,
                                  ),
                                ),
                              ),
                              onPressed:
                                  authViewModel.isSignout
                                      ? null
                                      : () async {
                                        await authViewModel.signOut();
                                        authViewModel.reset();
                                        GoRouter.of(context).pop();
                                        if (context.mounted) {
                                          GoRouter.of(
                                            context,
                                          ).goNamed(AppRouter.signInView);
                                        }
                                      },
                              child: Text(
                                'خروج',
                                style: AppTextStyle.lightSubtitle(
                                  layout,
                                ).copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  authViewModel.isSignout
                      ? Positioned.fill(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.lightPrimaryColor,
                          ),
                        ),
                      )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
    );
  }
}
