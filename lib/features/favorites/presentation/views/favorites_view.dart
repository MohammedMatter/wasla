import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/constants/lang_keys.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/favorites/presentation/widgets/favorites_body.dart';
import 'package:wasla/features/profile/presentation/view_models/profile_view_model.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.read<AppLayout>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            context.locale.languageCode == Locale('ar').languageCode
                ? Icons.arrow_circle_right_outlined
                : Icons.arrow_circle_left_outlined,

            color: AppColors.lightPrimaryColor,

            size: layout.fontXLarge.clamp(24.0, 32.0),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Consumer<ProfileViewModel>(
          builder:
              (context, vm, child) => Text(
                LangKeys.favoritesTitle.tr(),
                style: AppTextStyle.lightHeading1(layout).copyWith(
                  fontSize: layout.fontLarge.clamp(18.0, 24.0),
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      body: FavoritesBody(),
    );
  }
}
