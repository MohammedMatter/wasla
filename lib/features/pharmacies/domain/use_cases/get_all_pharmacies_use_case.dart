// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:wasla/features/pharmacies/domain/entities/pharmacy.dart';
import 'package:wasla/features/pharmacies/domain/repositories/pharmacy_repository.dart';

class GetAllPharmaciesUseCase {
  PharmacyRepository repository;
  GetAllPharmaciesUseCase({required this.repository});

  Future<List<Pharmacy>> call() async {
    return repository.getAllPharmacies();
  }
}
