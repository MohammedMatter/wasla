import 'package:geolocator/geolocator.dart';
import 'package:wasla/features/location/domain/entities/location_result.dart';

abstract class LocationRepository {
  Future<LocationResult> getCurrentLocation();
}
