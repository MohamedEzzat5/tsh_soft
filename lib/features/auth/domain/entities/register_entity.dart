import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final String? token;
  final CustomerEntity? customer;

  const RegisterEntity({
    this.token,
    this.customer,
  });

  @override
  List<Object?> get props => [token, customer];
}

class CustomerEntity extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? createdAt;
  final String? updatedAt;

  const CustomerEntity({
    this.id,
    this.name,
    this.email,
    this.password,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [id, name, email, password, createdAt, updatedAt];
}
