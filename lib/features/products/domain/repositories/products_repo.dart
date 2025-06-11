import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/product_params.dart';

abstract class ProductsRepository {
  Future<Either<Failure, BaseListResponse>> getProductsRepo();
  Future<Either<Failure, BaseOneResponse>> getProductDetailsRepo(
      {required ProductsParams params});
}
