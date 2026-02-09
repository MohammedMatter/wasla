class Product {
  String category;
  String name;
  String image;
  String price;
  double rating;
  String type;
  String description;
  List pharmacyAvailable;

  Product({
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
