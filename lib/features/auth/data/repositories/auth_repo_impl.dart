import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/exceptions.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/auth_params.dart';
import 'package:tsh_soft/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:tsh_soft/features/auth/domain/repositories/auth_repo.dart';
import 'package:tsh_soft/injection_container.dart';
import '../../../../core/utils/log_utils.dart' as log;

class AuthRepositoryImpl implements AuthRepository {
    final AuthRemoteDataSource remote;

  AuthRepositoryImpl({
    required this.remote,
  });
  
    @override
  Future<Either<Failure, BaseOneResponse>> registerRepo({required AuthParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final BaseOneResponse response = await remote.register(params: params);
        secureStorage.saveAccessToken(response.data.token);
        return Right(response);
      } on AppException catch (error) {
        log.Log.e(
            '[register] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, BaseOneResponse>> loginRepo({required AuthParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final BaseOneResponse response = await remote.login(params: params);
        secureStorage.saveAccessToken(response.data.token);
        return Right(response);
      } on AppException catch (error) {
        log.Log.e(
            '[login] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: 'No internet connection'));
    }
  }


}