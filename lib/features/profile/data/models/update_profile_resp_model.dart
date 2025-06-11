import 'package:tsh_soft/features/profile/domain/entities/update_profile_entity.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';

class UpdateProfileRespModel extends BaseOneResponse {
  const UpdateProfileRespModel({
    super.status,
    super.message,
    super.data,
  });

  factory UpdateProfileRespModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileRespModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] == null
          ? null
          : UpdateProfileModel.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}

class UpdateProfileModel extends UpdateProfileEntity {
  const UpdateProfileModel({
    super.id,
    super.name,
    super.phone,
    super.email,
    super.city,
    super.photo,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      city: json['city'],
      photo: json['photo'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "city": city,
        "photo": photo,
      };
}
