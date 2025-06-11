import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String? token;
  final CustomerEntity? customer;

  const LoginEntity({
    this.token,
    this.customer,
  });

  @override
  List<Object?> get props => [token, customer];
}

class CustomerEntity extends Equatable {
  final int? id;
  final String? name;
  final String? dialCode;
  final String? phone;
  final String? email;
  final String? password;
  final String? photo;
  final String? city;
  final String? otpExpiresAt;
  final String? createdAt;
  final String? updatedAt;

  const CustomerEntity({
    this.id,
    this.name,
    this.dialCode,
    this.phone,
    this.email,
    this.password,
    this.photo,
    this.city,
    this.otpExpiresAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        dialCode,
        phone,
        email,
        password,
        photo,
        city,
        otpExpiresAt,
        createdAt,
        updatedAt,
      ];
}
