import 'package:tsh_soft/core/api/end_points.dart';
import 'package:tsh_soft/core/error/exceptions.dart';
import 'package:tsh_soft/core/params/product_params.dart';
import 'package:tsh_soft/features/products/data/models/product_details_resp_model.dart';
import 'package:tsh_soft/features/products/data/models/products_resp_model.dart';
import 'package:tsh_soft/injection_container.dart';

abstract class ProductsRemoteDataSource {
  Future<ProductsRespModel> getProducts({required ProductsParams params});
  Future<ProductDetailsRespModel> getProductDetails(
      {required ProductsParams params});
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  @override
  Future<ProductsRespModel> getProducts(
      {required ProductsParams params}) async {
    try {
      final dynamic response = await dioConsumer.get(
        EndPoints.getProducts,
        queryParameters: params.id != null ? {'category_id': params.id} : {},
      );

      if (response['status'] == true) {
        return ProductsRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<ProductDetailsRespModel> getProductDetails(
      {required ProductsParams params}) async {
    try {
      final dynamic response = await dioConsumer.get(
        "${EndPoints.getProducts}/${params.id}",
      );
      if (response['status'] == true) {
        return ProductDetailsRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (error) {
      rethrow;
    }
  }
}
