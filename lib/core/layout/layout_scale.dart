import 'package:wasla/core/layout/breakpoints.dart';

class LayoutScale {
  final double scale;
  LayoutScale({required this.scale});

  LayoutScale layoutScaleFromWidth({required double width}) {
    if (width < Breakpoints.mobile) {
      return LayoutScale(scale: 0.8);
    } else if (width < Breakpoints.tablet) {
      return LayoutScale(scale: 1.0);
    } else {
      return LayoutScale(scale: 1.2);
    }
  }
}
