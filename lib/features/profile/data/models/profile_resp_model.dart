import 'package:tsh_soft/features/profile/domain/entities/profile_entity.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';

class ProfileRespModel extends BaseOneResponse {
  const ProfileRespModel({
    super.status,
    super.message,
    super.data,
  });

  factory ProfileRespModel.fromJson(Map<String, dynamic> json) {
    return ProfileRespModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] == null ? null : ProfileModel.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}

class ProfileModel extends ProfileEntity {
  const ProfileModel({
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

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
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

  Map<String, dynamic> toJson() => {
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
