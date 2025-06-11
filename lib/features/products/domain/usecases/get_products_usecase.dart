import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/products/domain/repositories/products_repo.dart';

class GetProductsUseCase extends UseCase<BaseListResponse, NoParams> {
  final ProductsRepository repository;

  GetProductsUseCase({required this.repository});

  @override
  Future<Either<Failure, BaseListResponse>> call(NoParams params) async {
    return await repository.getProductsRepo();
  }
}
