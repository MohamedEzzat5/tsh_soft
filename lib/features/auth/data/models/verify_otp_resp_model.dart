import 'package:tsh_soft/core/base_classes/base_one_response.dart';

class VerifyOtpRespModel extends BaseOneResponse {
  VerifyOtpRespModel({
    super.status,
    super.message,
    super.data,
  });

  factory VerifyOtpRespModel.fromJson(Map<String, dynamic> json) =>
      VerifyOtpRespModel(
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
