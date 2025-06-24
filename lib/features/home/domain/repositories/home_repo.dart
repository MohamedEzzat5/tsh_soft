import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/core/error/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, BaseListResponse>> getCategoriesRepo();
    Future<Either<Failure, BaseListResponse>> getSliders();

}
