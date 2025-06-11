import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/update_profile_params.dart';

abstract class ProfileRepository {
  Future<Either<Failure, BaseOneResponse>> getProfileRepo();
    Future<Either<Failure, BaseOneResponse>> updateProfileRepo(
      { required UpdateProfileParams params});

}
