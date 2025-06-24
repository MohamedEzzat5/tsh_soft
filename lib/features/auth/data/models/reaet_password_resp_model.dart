import 'package:tsh_soft/core/base_classes/base_one_response.dart';

class ResetPasswordRespModel extends BaseOneResponse {
  ResetPasswordRespModel({
    super.status,
    super.message,
    super.data,
  });

  factory ResetPasswordRespModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordRespModel(
        status: json['status'],
        message: json['message'],
        data: json['data'],
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data,
      };
}
