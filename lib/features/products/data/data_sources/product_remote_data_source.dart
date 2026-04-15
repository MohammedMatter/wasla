import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasla/features/products/data/models/product_model.dart';

class ProductRemoteDataSource {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> getAllProducts() async {
    final snapshot = await firebaseFirestore.collection('medicines').get();

    return snapshot.docs.map((doc) {
      return ProductModel.fromMap(doc.data());
    }).toList();
  }
}
