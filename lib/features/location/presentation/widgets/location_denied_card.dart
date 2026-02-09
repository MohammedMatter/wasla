import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/location/presentation/view_models/location_view_model.dart';

class LocationDeniedCard extends StatelessWidget {
  const LocationDeniedCard({super.key, required this.layout});

  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationViewModel>(
      builder:
          (context, locationViewModel, child) => Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: layout.md * 2),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(layout.lg),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.location_off,
                        size: layout.xl,
                        color: Colors.orangeAccent,
                      ),
                      SizedBox(height: layout.md),
                      Text(
                        'نحتاج إذن الموقع',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.lightHeading1(
                          layout,
                        ).copyWith(color: Colors.black87),
                      ),
                      SizedBox(height: layout.sm),
                      Text(
                        'للوصول إلى موقعك الحالي، يرجى منح إذن الموقع للتطبيق.',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.lightBody(
                          layout,
                        ).copyWith(color: Colors.black54),
                      ),
                      SizedBox(height: layout.lg),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.refresh, color: Colors.white),
                          label: Text(
                            'إعادة المحاولة',
                            style: AppTextStyle.lightHeading2(
                              layout,
                            ).copyWith(color: Colors.white),
                          ),
                          onPressed:
                              () => locationViewModel.getCurrentLocation(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lightPrimaryColor,
                            padding: EdgeInsets.symmetric(vertical: layout.md),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
