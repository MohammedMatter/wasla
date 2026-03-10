import 'package:wasla/features/pharmacies/domain/entities/pharmacy.dart';

class PharmacyModel extends Pharmacy {
  PharmacyModel({
    required super.pharmacyId,
    required super.address,
    required super.location,
    required super.name,
    required super.image,
    required super.distance,
    required super.rating,
    required super.isOpen,
  });

  factory PharmacyModel.fromMap(Map json) {
    return PharmacyModel(
      distance: (json['distance'] ?? 0.0).toDouble(),
      isOpen: json['isOpen'],
      rating: (json['rating'] ?? 0.0).toDouble(),
      image: json['image'],
      pharmacyId: json['pharmacy_id'],
      address: json['address'],
      location: json['location'],
      name: json['name'],
    );
  }
}
