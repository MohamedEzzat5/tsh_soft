import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/error/exceptions.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/core/utils/enums.dart';
import 'package:tsh_soft/core/utils/log_utils.dart' as log;
import 'package:tsh_soft/features/splash/domain/repositories/splash_repo.dart';
import 'package:tsh_soft/features/splash/domain/usecases/save_user_type_usecase.dart';
import 'package:tsh_soft/injection_container.dart';

class SplalashRepoImpl implements SplashRepository{
  
  @override
  Future<Either<Failure, UserType>> getUserType(
      {required NoParams params}) async {
    try {
      UserType userType = sharedPreferences.getUserType();
      return Right<Failure, UserType>(userType);
    } on AppException catch (error) {
      log.Log.e(
          '[getUserType] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, UserType>(error.toFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveUserType(
      {required SaveUserTypeParams params}) async {
    try {
      bool result = await sharedPreferences.saveUserType(params.type);
      return Right<Failure, bool>(result);
    } on AppException catch (error) {
      log.Log.e(
          '[saveUserType] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, bool>(error.toFailure());
    }
  }

}