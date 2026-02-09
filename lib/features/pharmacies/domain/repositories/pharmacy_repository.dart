import 'package:wasla/features/pharmacies/data/models/pharmacy_model.dart';
import 'package:wasla/features/pharmacies/domain/entities/pharmacy.dart';
import 'package:wasla/features/products/domain/entities/product.dart';

abstract class PharmacyRepository {
  Future<List<Pharmacy>> getAllPharmacies();
  Future<List<Product>> fetchProductsByPharmacyId({required String pharmacyId});
}
