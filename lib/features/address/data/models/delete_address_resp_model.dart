import 'package:tsh_soft/core/base_classes/base_one_response.dart';

class DeleteAddressRespModel extends BaseOneResponse {
  DeleteAddressRespModel({
    super.status,
    super.message,
    super.data,
  });

  factory DeleteAddressRespModel.fromJson(Map<String, dynamic> json) =>
      DeleteAddressRespModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}
