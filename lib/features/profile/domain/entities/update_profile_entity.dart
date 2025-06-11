import 'package:equatable/equatable.dart';

class UpdateProfileEntity extends Equatable {
  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? city;
  final String? photo;

  const UpdateProfileEntity({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.city,
    this.photo,
  });

  @override
  List<Object?> get props => [id, name, phone, email, city, photo];
}
