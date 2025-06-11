import 'package:equatable/equatable.dart';

class AuthParams extends Equatable {
  final String? email;
  final String? name;
  final String? phone;
  final String? password;
  final String? passwordConfirmation;

  const AuthParams(
      {this.email,
      this.name,
      this.phone,
      this.password,
      this.passwordConfirmation});

  @override
  List<Object?> get props =>
      [email, name, phone, password, passwordConfirmation];
}
