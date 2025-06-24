import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final int? id;
  final int? customerId;
  final String? title;
  final String? city;
  final String? area;
  final String? details;
  final String? createdAt;
  final String? updatedAt;

  const AddressEntity({
    this.id,
    this.customerId,
    this.title,
    this.city,
    this.area,
    this.details,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        customerId,
        title,
        city,
        area,
        details,
        createdAt,
        updatedAt,
      ];
}
