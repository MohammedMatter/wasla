import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/utils/screen_size.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';
import 'package:wasla/features/location/presentation/view_models/location_view_model.dart';

class FloatiingActionLocation extends StatelessWidget {
  const FloatiingActionLocation({
    super.key,
    required this.mapController,
    required this.layout,
  });

  final MapController mapController;
  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationViewModel>(
      builder:
          (context, locationViewModel, child) => Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: null,
                backgroundColor: AppColors.lightPrimaryColor,
                onPressed: () {
                  mapController.move(
                    LatLng(
                      locationViewModel.locationResult!.position!.latitude,
                      locationViewModel.locationResult!.position!.longitude,
                    ),
                    14.2,
                  );
                },
                child: Icon(Icons.location_searching, color: Colors.white),
              ),
              SizedBox(height: layout.md),
              Container(
                width: ScreenSize.w(context) * 0.1,
                color: const Color.fromARGB(255, 90, 99, 100).withOpacity(0.8),
                child: LayoutBuilder(
                  builder:
                      (context, constraints) => Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              locationViewModel.zoomIn();
                              mapController.move(
                                locationViewModel.selectedPharmacyLocation ??
                                    LatLng(
                                      locationViewModel
                                          .locationResult!
                                          .position!
                                          .latitude,
                                      locationViewModel
                                          .locationResult!
                                          .position!
                                          .longitude,
                                    ),
                                locationViewModel.zoom,
                              );
                            },
                            icon: Icon(Icons.add, color: Colors.white),
                          ),
                          SizedBox(
                            width: constraints.maxWidth,
                            child: Divider(),
                          ),
                          IconButton(
                            onPressed: () {
                              locationViewModel.zoomout();
                              mapController.move(
                                LatLng(
                                  locationViewModel
                                      .locationResult!
                                      .position!
                                      .latitude,
                                  locationViewModel
                                      .locationResult!
                                      .position!
                                      .longitude,
                                ),
                                locationViewModel.zoom,
                              );
                            },
                            icon: Icon(Icons.remove, color: Colors.white),
                          ),
                        ],
                      ),
                ),
              ),
            ],
          ),
    );
  }
}
