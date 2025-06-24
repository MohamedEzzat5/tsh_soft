import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/features/address/domain/entities/address_entity.dart';


class GetAddressesRespModel extends BaseListResponse {
  GetAddressesRespModel({
    super.status,
    super.message,
    super.data,
  });

  factory GetAddressesRespModel.fromJson(Map<String, dynamic> json) =>
      GetAddressesRespModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<AddressModel>.from(
                json["data"]!.map((x) => AddressModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AddressModel extends AddressEntity {
  const AddressModel({
    super.id,
    super.customerId,
    super.title,
    super.city,
    super.area,
    super.details,
    super.createdAt,
    super.updatedAt,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      customerId: json['customer_id'],
      title: json['title'],
      city: json['city'],
      area: json['area'],
      details: json['details'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer_id': customerId,
      'title': title,
      'city': city,
      'area': area,
      'details': details,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
