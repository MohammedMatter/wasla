import 'package:wasla/features/pharmacies/domain/entities/pharmacy.dart';

class PharmacyModel extends Pharmacy {
  PharmacyModel({
    required super.pharmacy_id,
    required super.address,
    required super.location,
    required super.name,
    required super.image,
  });

  factory PharmacyModel.fromMap(Map json) {
    return PharmacyModel(
      image: json['image'],
      pharmacy_id: json['pharmacy_id'],
      address: json['address'],
      location: json['location'],
      name: json['name'],
    );
  }
}
