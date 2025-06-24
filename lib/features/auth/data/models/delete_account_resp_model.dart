import 'package:tsh_soft/core/base_classes/base_one_response.dart';

class DeleteAccountRespModel extends BaseOneResponse {
  const DeleteAccountRespModel({
    super.data,
    super.status,
    super.message,
  });

  factory DeleteAccountRespModel.fromJson(Map<String, dynamic> json) =>
      DeleteAccountRespModel(
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
