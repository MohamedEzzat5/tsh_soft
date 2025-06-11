import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/auth_params.dart';

abstract class AuthRepository {
  Future<Either<Failure, BaseOneResponse>> registerRepo({
    required AuthParams params,
  });
  
  Future<Either<Failure, BaseOneResponse>> loginRepo({
    required AuthParams params,
  });
}