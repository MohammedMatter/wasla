import 'package:wasla/features/pharmacies/domain/repositories/pharmacy_repository.dart';
import 'package:wasla/features/products/domain/entities/product.dart';

class FetchProductsbyPharmacyidUseCase {
  PharmacyRepository repository;
  FetchProductsbyPharmacyidUseCase({required this.repository});
  Future<List<Product>> call({required String pharmacyId}) {
    return repository.fetchProductsByPharmacyId(pharmacyId: pharmacyId);
  }
}
