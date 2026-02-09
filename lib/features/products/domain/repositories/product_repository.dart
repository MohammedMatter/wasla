import 'package:wasla/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
}
