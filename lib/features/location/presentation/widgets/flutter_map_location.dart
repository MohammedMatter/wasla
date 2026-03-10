import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/features/location/domain/entities/location_result.dart';
import 'package:wasla/features/location/presentation/view_models/location_view_model.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';
import 'package:wasla/features/location/presentation/widgets/marker_layer_location.dart';

class FlutterMapLocation extends StatelessWidget {
  const FlutterMapLocation({
    super.key,
    required this.mapController,
    required this.result,
    required this.layout,
    required this.position,
  });

  final MapController mapController;
  final LocationResult? result;
  final AppLayout layout;
  final Position position;

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationViewModel>(
      builder:
          (context, locationViewModel, child) => FlutterMap(
            mapController: mapController,
            options: MapOptions(
              // onMapReady: () {
              //   mapController.move(
              //     LatLng(
              //       locationViewModel.locationResult!.position!.latitude,
              //       locationViewModel.locationResult!.position!.longitude,
              //     ),
              //     13,
              //   );
              // },
              initialCenter: LatLng(
                position.latitude.toDouble(),
                position.longitude.toDouble(),
              ),
              initialZoom: locationViewModel.zoom,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                userAgentPackageName: 'com.example.app',
              ),

              MarkerLayerLocation(
                result: result,
                layout: layout,
                mapController: mapController,
                position: position,
              ),
            ],
          ),
    );
  }
}
