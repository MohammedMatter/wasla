// ignore: depend_on_referenced_packages
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/features/location/domain/entities/location_result.dart';
import 'package:wasla/features/location/presentation/view_models/location_view_model.dart';
import 'package:wasla/features/pharmacies/presentation/view_models/pharmacy_view_model.dart';
import 'package:wasla/features/pharmacies/presentation/views/pharmacies_view.dart';

class MarkerLayerLocation extends StatelessWidget {
  const MarkerLayerLocation({
    super.key,
    required this.result,
    required this.layout,
    required this.mapController,
    required this.position,
  });

  final LocationResult? result;
  final AppLayout layout;
  final MapController mapController;
  final Position position;

  @override
  Widget build(BuildContext context) {
    return Consumer2<LocationViewModel, PharmacyViewModel>(
      builder:
          (context, locationViewModel, pharmacyViewModel, child) => MarkerLayer(
            markers: [
              Marker(
                point: LatLng(
                  position.latitude.toDouble(),
                  position.longitude.toDouble(),
                ),
                width: layout.xl * 2.4,

                height: layout.xl * 2.4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Marker(
                point: LatLng(
                  position.latitude.toDouble(),
                  position.longitude.toDouble(),
                ),
                width: 25,
                height: 25,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                ),
              ),
              ...pharmacyViewModel.pharmacies.map(
                (pharmacy) => Marker(
                  point: LatLng(
                    pharmacy.location['lat'],
                    pharmacy.location['lng'],
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.local_pharmacy,
                      color: Colors.red,
                      size: layout.fontXLarge,
                    ),
                    onPressed: () {
                      locationViewModel.selectPharmacyLocation(
                        pharmacyLocation: LatLng(
                          pharmacy.location['lat'],
                          pharmacy.location['lng'],
                        ),
                      );
                      mapController.move(
                        locationViewModel.selectedPharmacyLocation!,
                        14.6,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
