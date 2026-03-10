import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasla/features/products/data/models/product_model.dart';
import 'package:wasla/features/products/domain/entities/product.dart';

class ProductRemoteDataSource {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<List<Product>> getAllProducts() async {
    try {
      final snapshot = await firebaseFirestore.collection('medicines').get();
      List<ProductModel> products = [];
      for (var doc in snapshot.docs) {
        final peoductModel = ProductModel.fromMap(doc.data());
        products.add(peoductModel);
      }
      return products;
    } on Exception {
      return [];
    }
  }
}
