import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/constants/lang_keys.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/features/profile/presentation/widgets/section_settings_title.dart';
import 'package:wasla/features/profile/presentation/widgets/settings_item.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            context.locale.languageCode == 'ar'
                ? Icons.arrow_circle_right_outlined
                : Icons.arrow_circle_left_outlined,
            color: AppColors.lightPrimaryColor,
            size: layout.fontXLarge.clamp(24.0, 32.0),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          LangKeys.settingsTitle.tr(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: layout.md),
        child: Column(
          children: [
            SizedBox(height: layout.md),
            SectionSettingsTitle(title: LangKeys.accountSettings.tr()),
            SettingsItem(
              title: LangKeys.editProfile.tr(),
              icon: Icons.person_outline,
              onTap: () {},
            ),
            SettingsItem(
              title: LangKeys.changePassword.tr(),
              icon: Icons.lock_reset_outlined,
              onTap: () {},
            ),
            SizedBox(height: layout.lg),
            SectionSettingsTitle(title: LangKeys.appSettings.tr()),
            SettingsItem(
              title: LangKeys.language.tr(),
              icon: Icons.language_outlined,
              trailing: Text(
                context.locale.languageCode == 'ar' ? "العربية" : "English",
                style: TextStyle(color: AppColors.lightPrimaryColor),
              ),
              onTap: () {
                if (context.locale.languageCode == 'ar') {
                  context.setLocale(const Locale('en'));
                } else {
                  context.setLocale(const Locale('ar'));
                }

                GoRouter.of(context).goNamed(AppRouter.splashView);
              },
            ),
            SettingsItem(
              title: LangKeys.notifications.tr(),
              icon: Icons.notifications_none_outlined,
              trailing: Switch(
                value: true,
                onChanged: (val) {},
                activeColor: AppColors.lightPrimaryColor,
              ),
            ),
            SizedBox(height: layout.lg),
            SectionSettingsTitle(title: LangKeys.support.tr()),
            SettingsItem(
              title: LangKeys.privacyPolicy.tr(),
              icon: Icons.privacy_tip_outlined,
              onTap: () {},
            ),
            SettingsItem(
              title: LangKeys.contactUs.tr(),
              icon: Icons.headset_mic_outlined,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
