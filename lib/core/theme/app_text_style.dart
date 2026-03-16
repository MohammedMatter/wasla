import 'package:flutter/material.dart';
import 'package:wasla/core/layout/app_layout.dart';

class AppTextStyle {
  static TextStyle lightHeading1(AppLayout layout) => TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: layout.fontMedium,
    color: Colors.black,
    fontFamily: 'IBMPlexSansArabic',
  );

  static TextStyle lightHeading2(AppLayout layout) => TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: layout.fontSmall,
    color: Colors.black,
    fontFamily: 'tajawal',
  );

  static TextStyle lightBody(AppLayout layout) => TextStyle(
    fontSize: layout.fontSmall,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: 'IBMPlexSansArabic',
  );

  static TextStyle lightSubtitle(AppLayout layout) => TextStyle(
    fontSize: layout.fontSmall,
    fontWeight: FontWeight.w500,
    color: Color(0xff7E7575),
    fontFamily: 'IBMPlexSansArabic',
  );
}
