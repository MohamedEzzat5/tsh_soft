import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/features/auth/domain/entities/register_entity.dart';

class RegisterRespModel extends BaseOneResponse {
  const RegisterRespModel({
    super.status,
    super.message,
    super.data,
  });

  factory RegisterRespModel.fromJson(Map<String, dynamic> json) => RegisterRespModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : RegisterModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}


class RegisterModel extends RegisterEntity {
  const RegisterModel({
    super.token,
    super.customer,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
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
    super.email,
    super.password,
    super.createdAt,
    super.updatedAt,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
