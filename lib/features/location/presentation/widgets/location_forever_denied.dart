import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';

class LocationForeverDeniedCard extends StatelessWidget {
  const LocationForeverDeniedCard({super.key, required this.layout});

  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: layout.md * 2),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(layout.md),
          ),
          color: Colors.white,
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(layout.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_off,
                  size: layout.xl,
                  color: Colors.redAccent,
                ),
                SizedBox(height: layout.md),
                Text(
                  'تم رفض إذن الموقع للأبد',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.lightHeading1(
                    layout,
                  ).copyWith(color: Colors.black87),
                ),
                SizedBox(height: layout.sm),
                Text(
                  'لتمكين الموقع، يرجى الذهاب إلى إعدادات التطبيق وتفعيل إذن الموقع.',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.lightBody(
                    layout,
                  ).copyWith(color: Colors.black54),
                ),
                SizedBox(height: layout.lg),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.settings, color: Colors.white),
                    onPressed: () => Geolocator.openAppSettings(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightPrimaryColor,
                      padding: EdgeInsets.symmetric(vertical: layout.md),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(layout.md),
                      ),
                    ),
                    label: Text(
                      'فتح إعدادات التطبيق',
                      style: AppTextStyle.lightHeading2(
                        layout,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
