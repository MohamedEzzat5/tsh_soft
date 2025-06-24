import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/exceptions.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/auth_params.dart';
import 'package:tsh_soft/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:tsh_soft/features/auth/data/models/forget_password_resp_model.dart';
import 'package:tsh_soft/features/auth/data/models/reaet_password_resp_model.dart';
import 'package:tsh_soft/features/auth/data/models/verify_otp_resp_model.dart';
import 'package:tsh_soft/features/auth/domain/repositories/auth_repo.dart';
import 'package:tsh_soft/injection_container.dart';

import '../../../../core/utils/log_utils.dart' as log;

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl({
    required this.remote,
  });

  @override
  Future<Either<Failure, BaseOneResponse>> registerRepo(
      {required AuthParams params}) async {
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
  Future<Either<Failure, BaseOneResponse>> loginRepo(
      {required AuthParams params}) async {
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

  @override
  Future<Either<Failure, ForgotPasswordRespModel>> forgotPassword(
      {required AuthParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remote.forgotPassword(params: params);
        return Right(response);
      } on AppException catch (error) {
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, VerifyOtpRespModel>> verifyOtp(
      {required AuthParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remote.verifyOtp(params: params);
        return Right(response);
      } on AppException catch (error) {
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, ResetPasswordRespModel>> resetPassword(
      {required AuthParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remote.resetPassword(params: params);
        return Right(response);
      } on AppException catch (error) {
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, BaseOneResponse>> deleteAccount() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remote.deleteAccount();
        return Right(response);
      } on AppException catch (error) {
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, BaseOneResponse>> logout() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remote.logout();
        return Right(response);
      } on AppException catch (error) {
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }
}
