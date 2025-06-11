import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/product_params.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/products/domain/repositories/products_repo.dart';

class GetProductDetailsUseCase extends UseCase<BaseOneResponse, ProductsParams> {
  final ProductsRepository repository;

  GetProductDetailsUseCase({required this.repository});

  @override
  Future<Either<Failure, BaseOneResponse>> call(ProductsParams params) async {
    return await repository.getProductDetailsRepo(params: params);
  }
}
