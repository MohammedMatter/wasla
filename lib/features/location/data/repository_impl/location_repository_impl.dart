import 'package:geolocator/geolocator.dart';
import 'package:wasla/features/location/data/data_sources/location_remote_data_source.dart';
import 'package:wasla/features/location/domain/entities/location_result.dart';
import 'package:wasla/features/location/domain/repositories/location_repository.dart';

class LocationRepositoryImpl extends LocationRepository {
  LocationRemoteDataSource locationRemoteDataSource;
  LocationRepositoryImpl({required this.locationRemoteDataSource});

  @override
  Future<LocationResult> getCurrentLocation() {
    return locationRemoteDataSource.getCurrentLocation();
  }
}
