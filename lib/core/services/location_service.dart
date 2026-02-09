import 'package:geolocator/geolocator.dart';
import 'package:wasla/features/location/domain/entities/location_result.dart';
import 'package:wasla/features/location/domain/entities/location_status.dart';

class LocationService {
  static Future<LocationResult> getCurrentLocation() async {
    final isEnabled = await Geolocator.isLocationServiceEnabled();
    if (isEnabled == false) {
      return LocationResult(
        position: null,
        locationStatus: LocationStatus.serviceDisabled,
      );
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return LocationResult(
          position: null,
          locationStatus: LocationStatus.denied,
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return LocationResult(
        position: null,
        locationStatus: LocationStatus.deniedForever,
      );
    }
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return LocationResult(
      position: position,
      locationStatus: LocationStatus.granted,
    );
  }
}
