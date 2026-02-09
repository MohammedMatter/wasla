import 'dart:developer';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:wasla/features/location/domain/entities/location_result.dart';
import 'package:wasla/features/location/domain/use_cases/get_current_location_use_case.dart';

class LocationViewModel extends ChangeNotifier {
  double zoom = 14.6;
  LatLng? selectedPharmacyLocation;
  LocationResult? locationResult;
  GetCurrentLocationUseCase getCurrentLocationUseCase;
  LocationViewModel({required this.getCurrentLocationUseCase});

  Future<void> getCurrentLocation() async {
    locationResult = null;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
    locationResult = await getCurrentLocationUseCase.call();
    notifyListeners();
  }

  void zoomIn() {
    zoom += 0.15;
    notifyListeners();
  }

  void selectPharmacyLocation({required LatLng pharmacyLocation}) {
    selectedPharmacyLocation = pharmacyLocation;
    notifyListeners();
  }

  void zoomout() {
    if (zoom < 12) {
      zoom = 14.6;
      notifyListeners();
      return;
    }
    zoom -= 0.15;
    log(zoom.toString());
    notifyListeners();
  }
}
