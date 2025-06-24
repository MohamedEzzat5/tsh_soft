import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/features/auth/domain/entities/forget_password_entity.dart';

class ForgotPasswordRespModel extends BaseOneResponse {
  ForgotPasswordRespModel({
    super.status,
    super.message,
    super.data,
  });

  factory ForgotPasswordRespModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordRespModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null
            ? ForgotPasswordModel.fromJson(json['data'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data != null ? (data as ForgotPasswordModel).toJson() : null,
      };
}

class ForgotPasswordModel extends ForgotPasswordEntity {
  const ForgotPasswordModel({super.token});

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordModel(token: json['token']);

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}
