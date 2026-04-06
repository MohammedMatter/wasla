class Product {
  String category;
  String id;
  Map<String, dynamic> name;
  String image;
  String price;
  double rating;
  Map<String, dynamic> type;
  Map<String, dynamic> description;
  List pharmacyAvailable;

  Product({
    required this.id,
    required this.category,
    required this.description,
    required this.image,
    required this.name,
    required this.pharmacyAvailable,
    required this.price,
    required this.rating,
    required this.type,
  });
}
