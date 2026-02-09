import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasla/features/pharmacies/data/models/pharmacy_model.dart';
import 'package:wasla/features/products/data/models/product_model.dart';

class PharmacyRemoteDataSource {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<List<PharmacyModel>> getAllPharmacies() async {
    final snapshot = await firestore.collection('pharmacies').get();
    List<PharmacyModel> pharmacies = [];
    for (var pharmacy in snapshot.docs) {
      pharmacies.add(PharmacyModel.fromMap(pharmacy.data()));
    }
    return pharmacies;
  }

  Future<List<ProductModel>> fetchProductsByPharmacyId({
    required String pharmacyId,
  }) async {
    final snapshot =
        await firestore
            .collection('medicines')
            .where('pharmacy_ids', arrayContains: pharmacyId)
            .get();

    return snapshot.docs
        .map((doc) => ProductModel.fromMap(doc.data()))
        .toList();
  }
}
