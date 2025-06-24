import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/features/orders/data/models/order_resp_model.dart';

class CreateOrderRespModel extends BaseOneResponse {
  CreateOrderRespModel({
    super.status,
    super.message,
    super.data,
  });

  factory CreateOrderRespModel.fromJson(Map<String, dynamic> json) =>
      CreateOrderRespModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? OrderModel.fromJson(json['data']) : null,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data != null ? (data as OrderModel).toJson() : null,
      };
}
