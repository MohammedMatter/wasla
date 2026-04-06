import 'package:wasla/features/products/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.category,
    required super.description,
    required super.image,
    required super.name,
    required super.pharmacyAvailable,
    required super.price,
    required super.rating,
    required super.type,
    required super.id,
  });

  factory ProductModel.fromMap(Map json) {
    return ProductModel(
      category: json['category'],
      description: json['description'],
      image: json['image'],
      name: json['name'],
      pharmacyAvailable: json['pharmacyAvailable'],
      price: json['price'],
      rating: json['rating'],
      type: json['type'],
      id: json['id'],
    );
  }
}
