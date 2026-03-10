// ignore_for_file: public_member_api_docs, sort_constructors_first
class Pharmacy {
  String image;
  double rating;
  String pharmacyId;
  String address;
  String name;
  double distance;
  bool isOpen;
  Map<String, dynamic> location;
  Pharmacy({
    required this.distance,
    required this.rating,
    required this.isOpen,
    required this.image,
    required this.pharmacyId,
    required this.address,
    required this.location,
    required this.name,
  });
}
