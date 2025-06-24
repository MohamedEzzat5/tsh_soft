import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/features/address/data/models/get_addresses_resp_model.dart';
import 'package:tsh_soft/features/cart/data/models/cart_resp_model.dart';
import 'package:tsh_soft/features/orders/domain/entities/order_entity.dart';

class GetOrdersRespModel extends BaseListResponse {
  GetOrdersRespModel({
    super.status,
    super.message,
    super.data,
  });

  factory GetOrdersRespModel.fromJson(Map<String, dynamic> json) =>
      GetOrdersRespModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] == null
            ? []
            : List<OrderModel>.from(
                json['data'].map((x) => OrderModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data == null
            ? []
            : List<dynamic>.from(data!.map((x) => (x as OrderModel).toJson())),
      };
}

class OrderModel extends OrderEntity {
  const OrderModel({
    super.id,
    super.customerId,
    super.addressId,
    super.cartId,
    super.status,
    super.total,
    super.createdAt,
    super.updatedAt,
    super.note,
    super.cart,
    super.address,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'] is int
            ? json['id']
            : int.tryParse(json['id']?.toString() ?? ''),
        customerId: json['customer_id'] is int
            ? json['customer_id']
            : int.tryParse(json['customer_id']?.toString() ?? ''),
        addressId: json['address_id']?.toString(),
        cartId: json['cart_id'] is int
            ? json['cart_id']
            : int.tryParse(json['cart_id']?.toString() ?? ''),
        status: json['status']?.toString(),
        total: json['total']?.toString(),
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        note: json['note'],
        cart: json['cart'] != null ? CartModel.fromJson(json['cart']) : null,
        address: json['address'] != null
            ? AddressModel.fromJson(json['address'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'customer_id': customerId,
        'address_id': addressId,
        'cart_id': cartId,
        'status': status,
        'total': total,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'note': note,
        'cart': cart != null ? (cart as CartModel).toJson() : null,
        'address': address != null ? (address as AddressModel).toJson() : null,
      };
}
