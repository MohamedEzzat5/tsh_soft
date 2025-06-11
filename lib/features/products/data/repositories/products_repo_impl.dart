import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/exceptions.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/product_params.dart';
import 'package:tsh_soft/features/products/data/datasources/products_remote_data_source.dart';
import 'package:tsh_soft/features/products/domain/repositories/products_repo.dart';
import 'package:tsh_soft/injection_container.dart';
import 'package:tsh_soft/core/utils/log_utils.dart' as log;


class ProductsRepoImpl implements ProductsRepository {
  final ProductsRemoteDataSource remote;

  ProductsRepoImpl({required this.remote});
  @override
  Future<Either<Failure, BaseOneResponse>> getProductDetailsRepo({required ProductsParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        BaseOneResponse responseRepo =
            await remote.getProductDetails(params: params);
        return Right(responseRepo);
      } on AppException catch (error) {
        log.Log.e(
            '[getProductDetails] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, BaseListResponse>> getProductsRepo() async {
    if (await networkInfo.isConnected) {
      try {
        BaseListResponse responseRepo =
            await remote.getProducts();
        return Right(responseRepo);
      } on AppException catch (error) {
        log.Log.e(
            '[getProducts] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: "No Internet Connection"));
    }
  }
}