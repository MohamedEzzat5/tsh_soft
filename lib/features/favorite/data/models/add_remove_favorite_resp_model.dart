import 'package:tsh_soft/core/base_classes/base_one_response.dart';

class AddToFavoriteRespModel extends BaseOneResponse {
  const AddToFavoriteRespModel({
    super.status,
    super.message,
    super.data,
  });

  factory AddToFavoriteRespModel.fromJson(Map<String, dynamic> json) =>
      AddToFavoriteRespModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] ?? {},
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data ?? {},
      };
}
