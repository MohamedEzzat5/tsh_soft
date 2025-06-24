import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/favorite/domain/repositories/favorite_repo.dart';

class GetFavoritesUseCase extends UseCase<BaseListResponse, NoParams> {
  final FavouriteRepo favoritesRepository;

  GetFavoritesUseCase({required this.favoritesRepository});

  @override
  Future<Either<Failure, BaseListResponse>> call(NoParams params) =>
      favoritesRepository.getFavorites();
}
