import 'package:tsh_soft/core/error/exceptions.dart';
import 'package:tsh_soft/core/params/cart_params.dart';
import 'package:tsh_soft/features/cart/data/models/cart_resp_model.dart';
import 'package:tsh_soft/injection_container.dart';

abstract class CartRemoteDataSource {
  Future<MainCartRespModel> getCart();
  Future<MainCartRespModel> addToCart({required CartParams params});
  Future<MainCartRespModel> updateCartItem({required CartParams params});
  Future<MainCartRespModel> deleteCartItem({required CartParams params});
}

class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  @override
  Future<MainCartRespModel> getCart() async {
    try {
      final response = await dioConsumer.get(
        '/cart',
      );
      if (response['status'] == true) {
        return MainCartRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MainCartRespModel> addToCart({required CartParams params}) async {
    try {
      Map<String, dynamic> body = {
        'product_id': params.productId,
        'quantity': params.quantity,
      };
      final response = await dioConsumer.post('/add-to-cart', body: body);
      if (response['status'] == true) {
        return MainCartRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MainCartRespModel> deleteCartItem({required CartParams params}) async {
    try {
      Map<String, dynamic> body = {
        'product_id': params.productId,
      };

      final response =
          await dioConsumer.post('/delete-item-from-cart', body: body);
      if (response['status'] == true) {
        return MainCartRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MainCartRespModel> updateCartItem({required CartParams params}) async {
    try {
      Map<String, dynamic> body = {
        'product_id': params.productId,
        'quantity': params.quantity,
      };
      final response = await dioConsumer.post('/update-cart', body: body);
      if (response['status'] == true) {
        return MainCartRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (e) {
      rethrow;
    }
  }
}
