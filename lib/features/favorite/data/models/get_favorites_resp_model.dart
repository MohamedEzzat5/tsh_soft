import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/features/products/data/models/products_resp_model.dart';


class GetFavoritesRespModel extends BaseListResponse {
  GetFavoritesRespModel({
    super.status,
    super.message,
    super.data,
  });

  factory GetFavoritesRespModel.fromJson(Map<String, dynamic> json) =>
      GetFavoritesRespModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] == null
            ? []
            : List<ProductModel>.from(
                json['data'].map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data == null
            ? []
            : List<dynamic>.from(
                data!.map((x) => (x as ProductModel).toJson())),
      };
}
