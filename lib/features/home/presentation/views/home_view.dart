import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/home/presentation/widgets/home_body.dart';
import 'package:wasla/features/profile/presentation/view_models/profile_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.read<AppLayout>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.location_on_outlined,
            color: AppColors.lightPrimaryColor,
            size: layout.fontXLarge * 1.3,
          ),
        ),

        title: Consumer<ProfileViewModel>(
          builder:
              (context, vm, child) =>
                  Text('وصلة', style: AppTextStyle.lightHeading1(layout)),
        ),
      ),
      body: HomeBody(),
    );
  }
}
