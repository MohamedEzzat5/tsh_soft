import 'package:tsh_soft/core/error/exceptions.dart';
import 'package:tsh_soft/core/params/order_params.dart';
import 'package:tsh_soft/features/orders/data/models/create_order_resp_model.dart';
import 'package:tsh_soft/features/orders/data/models/order_resp_model.dart';
import 'package:tsh_soft/injection_container.dart';

abstract class OrdersRemoteDataSource {
  Future<GetOrdersRespModel> getOrders({required OrderParams params});
  Future<CreateOrderRespModel> createOrder({required OrderParams params});
}

class OrdersRemoteDataSourceImpl extends OrdersRemoteDataSource {
  @override
  Future<GetOrdersRespModel> getOrders({required OrderParams params}) async {
    try {
      Map<String, dynamic> body = {};
      if (params.status != null) {
        body['status'] = params.status;
      }
      final response = await dioConsumer.get(
        '/orders',
        body: body,
      );
      if (response['status'] == true) {
        return GetOrdersRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CreateOrderRespModel> createOrder(
      {required OrderParams params}) async {
    try {
      Map<String, dynamic> body = {
        'address_id': params.addressId != null ? params.addressId : null,
        'cart_id': params.cartId != null ? params.cartId : null,
        'note': params.note != null ? params.note : "",
      };
      final response = await dioConsumer.post(
        '/orders',
        body: body,
      );
      if (response['status'] == true) {
        return CreateOrderRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (e) {
      rethrow;
    }
  }
}
