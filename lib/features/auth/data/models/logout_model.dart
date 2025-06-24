import 'package:tsh_soft/core/base_classes/base_one_response.dart';

class LogOutRespModel extends BaseOneResponse {
  const LogOutRespModel({
    super.data,

    super.status,
    super.message,
  });

  factory LogOutRespModel.fromJson(Map<String, dynamic> json) =>
      LogOutRespModel(
        data: json["data"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "status": status,
        "message": message,
      };
}
