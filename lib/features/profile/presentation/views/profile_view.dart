import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/profile/presentation/view_models/profile_view_model.dart';
import 'package:wasla/features/profile/presentation/widgets/profile_body.dart';

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
                style: AppTextStyle.lightHeading1(layout).copyWith(
                  fontSize: layout.fontLarge.clamp(18.0, 24.0),
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ProfileBody(),
    );
  }
}
