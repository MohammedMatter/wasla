import 'package:geolocator/geolocator.dart';
import 'package:wasla/features/location/domain/entities/location_status.dart';

class LocationResult {
  Position? position;
  LocationStatus locationStatus;
  LocationResult({required this.position, required this.locationStatus});
}
