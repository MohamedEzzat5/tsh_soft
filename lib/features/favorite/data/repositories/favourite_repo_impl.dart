import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/exceptions.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/product_params.dart';
import 'package:tsh_soft/features/favorite/data/datasources/favorite_remote_data_source.dart';
import 'package:tsh_soft/features/favorite/data/models/get_favorites_resp_model.dart';
import 'package:tsh_soft/features/favorite/domain/repositories/favorite_repo.dart';
import 'package:tsh_soft/injection_container.dart';

class FavouriteRepoImpl implements FavouriteRepo {
  final FavoriteRemoteDataSource remote;
  FavouriteRepoImpl({
    required this.remote,
  });
  @override
  Future<Either<Failure, BaseOneResponse>> addToFavoriteRepo(
      {required ProductsParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final BaseOneResponse response =
            await remote.addToFavorite(params: params);
        return Right(response);
      } on AppException catch (e) {
        return Left(e.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: 'No internet connection'));
    }
  }

    @override
  Future<Either<Failure, GetFavoritesRespModel>> getFavorites() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remote.getFavorites();
        return Right(response);
      } on AppException catch (error) {
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }
}
