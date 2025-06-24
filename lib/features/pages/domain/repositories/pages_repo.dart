import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/page_params.dart';

abstract class PagesRepository {
  Future<Either<Failure, BaseOneResponse>> getPage(
      {required PageParams params});
}

