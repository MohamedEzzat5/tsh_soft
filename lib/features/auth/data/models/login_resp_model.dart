import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/features/auth/domain/entities/login_entity.dart';

class LoginRespModel extends BaseOneResponse {
  const LoginRespModel({
    super.status,
    super.message,
    super.data,
  });

  factory LoginRespModel.fromJson(Map<String, dynamic> json) =>
      LoginRespModel(
        status: json["status"],
        message: json["message"],
        data:
            json["data"] == null ? null : LoginModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}


class LoginModel extends LoginEntity {
  const LoginModel({
    super.token,
    super.customer,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json['token'],
      customer: json['customer'] != null
          ? CustomerModel.fromJson(json['customer'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'customer': customer != null ? (customer as CustomerModel).toJson() : null,
    };
  }
}

class CustomerModel extends CustomerEntity {
  const CustomerModel({
    super.id,
    super.name,
    super.dialCode,
    super.phone,
    super.email,
    super.password,
    super.photo,
    super.city,
    super.otpExpiresAt,
    super.createdAt,
    super.updatedAt,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      name: json['name'],
      dialCode: json['dial_code'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
      photo: json['photo'],
      city: json['city'],
      otpExpiresAt: json['otp_expires_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'dial_code': dialCode,
      'phone': phone,
      'email': email,
      'password': password,
      'photo': photo,
      'city': city,
      'otp_expires_at': otpExpiresAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
