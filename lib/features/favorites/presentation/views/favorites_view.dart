import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.arrow_circle_right_outlined,
              color: AppColors.lightPrimaryColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        title: Consumer<ProfileViewModel>(
          builder:
              (context, vm, child) =>
                  Text('المفضلة', style: AppTextStyle.lightHeading1(layout)),
        ),
      ),
      body: FavoritesBody(),
    );
  }
}
