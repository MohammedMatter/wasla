import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/features/location/domain/entities/location_result.dart';
import 'package:wasla/features/location/domain/entities/location_status.dart';
import 'package:wasla/features/location/presentation/view_models/location_view_model.dart';
import 'package:wasla/features/location/presentation/widgets/flutter_map_location.dart';
import 'package:wasla/features/location/presentation/widgets/location_denied_card.dart';
import 'package:wasla/features/location/presentation/widgets/location_forever_denied.dart';

class LocationBody extends StatelessWidget {
  const LocationBody({super.key, required this.mapController});

  final MapController mapController;

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.read<AppLayout>();
    return Consumer<LocationViewModel>(
      builder: (context, locationViewModel, child) {
        final LocationResult? result = locationViewModel.locationResult;

        if (result == null) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.lightPrimaryColor,
            ),
          );
        }
        switch (result.locationStatus) {
          case LocationStatus.granted:
            return FlutterMapLocation(
              mapController: mapController,
              result: result,
              layout: layout,
              position: result.position!,
            );
          case LocationStatus.denied:
            return LocationDeniedCard(layout: layout);
          case LocationStatus.deniedForever:
            return LocationForeverDeniedCard(layout: layout);
          case LocationStatus.serviceDisabled:
            return Center(child: Text('الخدمة معطلة'));
        }
      },
    );
  }
}
