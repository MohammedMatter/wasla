import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_text_style.dart';

class SectionSettingsTitle extends StatelessWidget {
  SectionSettingsTitle({super.key, required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: layout.sm),
        child: Text(title, style: AppTextStyle.lightHeading1(layout)),
      ),
    );
  }
}
