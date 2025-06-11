import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/exceptions.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/update_profile_params.dart';
import 'package:tsh_soft/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:tsh_soft/features/profile/domain/repositories/profile_repo.dart';
import 'package:tsh_soft/injection_container.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remote;

  ProfileRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, BaseOneResponse>> getProfileRepo() async {
    if (await networkInfo.isConnected) {
      try {
        final BaseOneResponse response = await remote.getProfile();
        return Right(response);
      } on AppException catch (e) {
        return Left(e.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, BaseOneResponse>> updateProfileRepo(
      {required UpdateProfileParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final BaseOneResponse response =
            await remote.updateProfile(params: params);
        return Right(response);
      } on AppException catch (e) {
        return Left(e.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: 'No internet connection'));
    }
  }
}
