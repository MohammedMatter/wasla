import 'package:wasla/features/location/domain/entities/location_result.dart';
import 'package:wasla/features/location/domain/repositories/location_repository.dart';

class GetCurrentLocationUseCase {
  LocationRepository repository;
  GetCurrentLocationUseCase({required this.repository});

  Future<LocationResult> call() async {
    return await repository.getCurrentLocation();
  }
}
