// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:wasla/features/pharmacies/data/data_sources/pharmacy_remote_data_source.dart';
import 'package:wasla/features/pharmacies/domain/entities/pharmacy.dart';
import 'package:wasla/features/pharmacies/domain/repositories/pharmacy_repository.dart';
import 'package:wasla/features/products/domain/entities/product.dart';

class PharmacyRepositoryImpl extends PharmacyRepository {
  PharmacyRemoteDataSource remoteDataSource;
  PharmacyRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Pharmacy>> getAllPharmacies() {
    return remoteDataSource.getAllPharmacies();
  }

  @override
  Future<List<Product>> fetchProductsByPharmacyId({
    required String pharmacyId,
  }) {
    return remoteDataSource.fetchProductsByPharmacyId(pharmacyId: pharmacyId);
  }
}
