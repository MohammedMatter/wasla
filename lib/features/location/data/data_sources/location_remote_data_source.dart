import 'package:geolocator/geolocator.dart';
import 'package:wasla/core/services/location_service.dart';
import 'package:wasla/features/location/domain/entities/location_result.dart';

class LocationRemoteDataSource {
  Future<LocationResult> getCurrentLocation() async {
    return await LocationService.getCurrentLocation();
  }
}
