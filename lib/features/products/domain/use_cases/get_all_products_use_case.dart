import 'package:wasla/features/products/domain/entities/product.dart';
import 'package:wasla/features/products/domain/repositories/product_repository.dart';

class GetAllProductsUseCase {
  ProductRepository repository;
  GetAllProductsUseCase({required this.repository});

  Future<List<Product>> call() async {
    return repository.getAllProducts();
  }
}
