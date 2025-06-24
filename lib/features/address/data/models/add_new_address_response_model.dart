import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/features/address/data/models/get_addresses_resp_model.dart';

class AddNewAddressRespModel extends BaseOneResponse {
  AddNewAddressRespModel({
    super.status,
    super.message,
    super.data,
  });

  factory AddNewAddressRespModel.fromJson(Map<String, dynamic> json) =>
      AddNewAddressRespModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : AddressModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}
