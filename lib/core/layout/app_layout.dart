// import 'package:wasla/core/layout/layout_scale.dart';
// import 'package:wasla/core/theme/design_tokens.dart';

// class AppLayout {
//   double scale;
//   AppLayout() : scale = 1.0;
//   AppLayout._({required this.scale});
//   factory AppLayout.fromWidth({required double width}) {
//     return AppLayout._(
//       scale: LayoutScale(scale: width).layoutScaleFromWidth(width: width).scale,
//     );
//   }

//   double get xs => AppSpacing.xs * scale;
//   double get sm => AppSpacing.sm * scale;
//   double get md => AppSpacing.md * scale;
//   double get lg => AppSpacing.lg * scale;
//   double get xl => AppSpacing.xl * scale;

//   double get rsm => AppRadius.sm * scale;
//   double get rmd => AppRadius.md * scale;
//   double get rlg => AppRadius.lg * scale;

//   double get fontSmall => AppFontSize.fontSmall * scale;
//   double get fontMedium => AppFontSize.fontMedium * scale;
//   double get fontLarge => AppFontSize.fontLarge * scale;
//   double get fontXLarge => AppFontSize.fontXLarge * scale;
// }
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasla/core/theme/design_tokens.dart';

class AppLayout {
  AppLayout();
  double get xs => AppSpacing.xs.w;
  double get sm => AppSpacing.sm.w;
  double get md => AppSpacing.md.w;
  double get lg => AppSpacing.lg.w;
  double get xl => AppSpacing.xl.w;

  double get rsm => AppRadius.sm.r;
  double get rmd => AppRadius.md.r;
  double get rlg => AppRadius.lg.r;

  double get fontSmall => AppFontSize.fontSmall.sp;
  double get fontMedium => AppFontSize.fontMedium.sp;
  double get fontLarge => AppFontSize.fontLarge.sp;
  double get fontXLarge => AppFontSize.fontXLarge.sp;
}
