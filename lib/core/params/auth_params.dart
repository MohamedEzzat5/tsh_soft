import 'package:equatable/equatable.dart';

class AuthParams extends Equatable {
  final String? email;
  final String? name;
  final String? phone;
  final String? password;
  final String? passwordConfirmation;
  final String? photo;
  final String? otp;

  const AuthParams({
    this.email,
    this.name,
    this.photo,
    this.phone,
    this.password,
    this.passwordConfirmation,
    this.otp,
  });

  @override
  List<Object?> get props => [
        email,
        name,
        phone,
        password,
        passwordConfirmation,
        photo,
        otp,
      ];
}
