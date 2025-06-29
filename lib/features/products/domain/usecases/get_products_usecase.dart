import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/product_params.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/products/domain/repositories/products_repo.dart';

class GetProductsUseCase extends UseCase<BaseListResponse,  ProductsParams > {
  final ProductsRepository repository;

  GetProductsUseCase({required this.repository});

  @override
  Future<Either<Failure, BaseListResponse>> call(ProductsParams params) async {
    return await repository.getProductsRepo(params: params);
  }
}
