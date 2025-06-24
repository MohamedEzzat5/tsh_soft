import 'package:tsh_soft/core/api/end_points.dart';
import 'package:tsh_soft/core/error/exceptions.dart';
import 'package:tsh_soft/features/home/data/models/categories_resp_model.dart';
import 'package:tsh_soft/features/home/data/models/slider_resp_model.dart';
import 'package:tsh_soft/injection_container.dart';

abstract class HomeRemoteDataSource {
  Future<CategoryListRespModel> getCategories();
    Future<GetSlidersRespModel> getSliders();

}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<CategoryListRespModel> getCategories() async {
    try {
      final response = await dioConsumer.get(
        EndPoints.getCategories,
       
        );

      if (response['status'] == true) {
        return CategoryListRespModel.fromJson(response);
      }

      throw ServerException(message: response['message'] ?? 'Unexpected error');
    } catch (error) {
      rethrow;
    }
  }
  @override
   Future<GetSlidersRespModel> getSliders() async {
    try {
      final response = await dioConsumer.get('/home-sections');
      if (response['status'] == true) {
        return GetSlidersRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (e) {
      rethrow;
    }
  }
}
