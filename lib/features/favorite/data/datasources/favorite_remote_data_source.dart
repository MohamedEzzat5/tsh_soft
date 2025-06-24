import 'package:tsh_soft/core/error/exceptions.dart';
import 'package:tsh_soft/core/params/product_params.dart';
import 'package:tsh_soft/features/favorite/data/models/add_remove_favorite_resp_model.dart';
import 'package:tsh_soft/features/favorite/data/models/get_favorites_resp_model.dart';
import 'package:tsh_soft/injection_container.dart';

abstract class FavoriteRemoteDataSource {
  Future<AddToFavoriteRespModel> addToFavorite(
      {required ProductsParams params});
  Future<GetFavoritesRespModel> getFavorites();
}

class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  @override
  Future<AddToFavoriteRespModel> addToFavorite(
      {required ProductsParams params}) async {
    try {
      final response = await dioConsumer.get(
        '/add-to-favorite/${params.id}',
      );

      if (response['status'] == true) {
        return AddToFavoriteRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GetFavoritesRespModel> getFavorites() async {
    try {
      final response = await dioConsumer.get('/my-favorite');
      if (response['status'] == true) {
        return GetFavoritesRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (e) {
      rethrow;
    }
  }
}
