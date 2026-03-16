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
  SearchHome({super.key, required this.hintText, this.canRequestFocus = false});
  String hintText;

  bool canRequestFocus;
  @override
  Widget build(BuildContext context) {
    AppLayout layout = AppLayout();
    return Container(
      color: AppColors.lightBackgroundColor,
      child: Padding(
        padding: EdgeInsets.all(layout.md),
        child: Consumer<MainNavigationViewModel>(
          builder:
              (context, vm, child) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(layout.sm),
                  border: Border.all(color: Color(0xffAAAAAA), width: 1.4),
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    canRequestFocus: canRequestFocus,
                    enabled: true,

                    onTap: () {
                      context.read<SearchViewModel>().reset();

                      !canRequestFocus
                          ? GoRouter.of(context).goNamed(AppRouter.searchView)
                          : null;
                    },
                    onChanged: (value) {
                      if (GoRouter.of(context).state.path == 'pharmaciesView') {
                        log('نعم نحن في صفحة الصيدلية ');
                        context
                            .read<SearchViewModel>()
                            .updatePharmacySearchQuery(value);
                      } else {
                        context
                            .read<SearchViewModel>()
                            .updateProductSearchQuery(value);
                      }
                    },
                    cursorColor: AppColors.lightPrimaryColor,
                    cursorOpacityAnimates: true,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: hintText,

                      hintStyle: AppTextStyle.lightHeading1(layout).copyWith(
                        color: Colors.grey,
                        fontSize: layout.fontSmall,
                      ),
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: layout.md * 0.7,
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
