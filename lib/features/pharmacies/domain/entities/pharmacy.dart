// ignore_for_file: public_member_api_docs, sort_constructors_first
class Pharmacy {
  String image;
  String pharmacy_id;
  String address;
  Map<String, dynamic> location;
  String name;
  Pharmacy({
    required this.image,
    required this.pharmacy_id,
    required this.address,
    required this.location,
    required this.name,
  });
}
