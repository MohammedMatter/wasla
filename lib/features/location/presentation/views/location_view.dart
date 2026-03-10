import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/location/domain/entities/location_status.dart';
import 'package:wasla/features/location/presentation/view_models/location_view_model.dart';
import 'package:wasla/features/location/presentation/widgets/floating_action_location.dart';
import 'package:wasla/features/location/presentation/widgets/location_body.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  final mapController = MapController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final locationViewModel = context.read<LocationViewModel>();
      await locationViewModel.getCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.read<AppLayout>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الصيدليات على الخريطة",
          style: AppTextStyle.lightHeading1(layout),
        ),
      ),
      body: LocationBody(mapController: mapController),
      floatingActionButton: Consumer<LocationViewModel>(
        builder:
            (context, locationViewModel, child) =>
                locationViewModel.locationResult?.locationStatus !=
                        LocationStatus.granted
                    ? SizedBox.shrink()
                    : FloatiingActionLocation(
                      mapController: mapController,
                      layout: layout,
                    ),
      ),
    );
  }
}
