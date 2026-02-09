import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/main_navigation/presentation/view_models/main_navigation_view_model.dart';
import 'package:wasla/features/search/presentation/view_models/search_view_model.dart';

// ignore: must_be_immutable
class SearchHome extends StatelessWidget {
  SearchHome({
    super.key,
    required this.layout,
    required this.hintText,
    this.canRequestFocus = false,
  });
  String hintText;
  final AppLayout layout;
  bool canRequestFocus;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightBackgroundColor,
      child: Padding(
        padding: EdgeInsets.only(
          left: layout.xl,
          right: layout.xl,
          top: layout.lg,
          bottom: layout.md,
        ),
        child: Consumer<MainNavigationViewModel>(
          builder:
              (context, vm, child) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(layout.sm),
                  border: Border.all(
                    color: AppColors.lightPrimaryColor,
                    width: 1.4,
                  ),
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    canRequestFocus: canRequestFocus,
                    enabled: true,

                    onTap: () {
                      !canRequestFocus
                          ? GoRouter.of(context).goNamed(AppRouter.searchView)
                          : null;
                    },
                    onChanged: (value) {
                      context.read<SearchViewModel>().updateSearchQuery(value);
                      log(
                        'Search query updated to: ${context.read<SearchViewModel>().searchQuery}',
                      );
                    },
                    cursorColor: AppColors.lightPrimaryColor,
                    cursorOpacityAnimates: true,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: hintText,

                      hintStyle: AppTextStyle.lightHeading1(layout).copyWith(
                        color: Colors.grey,
                        fontSize: layout.fontMedium,
                      ),
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: layout.md,
                        horizontal: layout.sm,
                      ),
                    ),
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
