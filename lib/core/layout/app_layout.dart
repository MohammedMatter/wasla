import 'package:wasla/core/layout/layout_scale.dart';
import 'package:wasla/core/theme/design_tokens.dart';

class AppLayout {
  double scale;
  AppLayout() : scale = 1.0;
  AppLayout._({required this.scale});
  factory AppLayout.fromWidth({required double width}) {
    return AppLayout._(
      scale: LayoutScale(scale: width).layoutScaleFromWidth(width: width).scale,
    );
  }

  double get xs => AppSpacing.xs * scale;
  double get sm => AppSpacing.sm * scale;
  double get md => AppSpacing.md * scale;
  double get lg => AppSpacing.lg * scale;
  double get xl => AppSpacing.xl * scale;

  double get rsm => AppRadius.sm * scale;
  double get rmd => AppRadius.md * scale;
  double get rlg => AppRadius.lg * scale;

  double get fontSmall => AppFontSize.fontSmall * scale;
  double get fontMedium => AppFontSize.fontMedium * scale;
  double get fontLarge => AppFontSize.fontLarge * scale;
  double get fontXLarge => AppFontSize.fontXLarge * scale;
}
