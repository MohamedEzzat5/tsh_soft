import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/params/product_params.dart';
import 'package:tsh_soft/features/favorite/domain/repositories/favorite_repo.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class AddToFavoriteUseCase implements UseCase<BaseOneResponse, ProductsParams> {
  final FavouriteRepo favRepositry;

  AddToFavoriteUseCase({required this.favRepositry});
  @override
  Future<Either<Failure, BaseOneResponse>> call(ProductsParams params) =>
      favRepositry.addToFavoriteRepo(params: params);
}
