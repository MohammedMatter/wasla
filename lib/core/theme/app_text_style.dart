import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasla/core/layout/app_layout.dart';

class AppTextStyle {
  static TextStyle lightHeading1(AppLayout layout) =>
      GoogleFonts.ibmPlexSansArabic(
        fontWeight: FontWeight.w700,
        fontSize: layout.fontLarge,
        color: Colors.black,
      );

  static TextStyle lightHeading2(AppLayout layout) => GoogleFonts.tajawal(
    fontWeight: FontWeight.w700,
    fontSize: layout.fontMedium * 1.25,
    color: Colors.black,
  );

  static TextStyle lightBody(AppLayout layout) => GoogleFonts.ibmPlexSansArabic(
    fontSize: layout.fontMedium * 1.38,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle lightSubtitle(AppLayout layout) =>
      GoogleFonts.ibmPlexSansArabic(
        fontSize: layout.fontMedium,
        fontWeight: FontWeight.w500,
        color: Color(0xff7E7575),
      );
}
