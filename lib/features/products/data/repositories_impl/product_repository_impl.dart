import 'package:wasla/features/products/data/data_sources/product_remote_data_source.dart';
import 'package:wasla/features/products/domain/entities/product.dart';
import 'package:wasla/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  Future<List<Product>> getAllProducts() {
    return productRemoteDataSource.getAllProducts();
  }
}
