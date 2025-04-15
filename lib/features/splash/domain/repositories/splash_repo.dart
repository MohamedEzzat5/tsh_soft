import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/enums.dart';
import '../usecases/save_user_type_usecase.dart';

abstract class SplashRepository {
  Future<Either<Failure, UserType>> getUserType({
    required NoParams params,
  });

  Future<Either<Failure, bool>> saveUserType({
    required SaveUserTypeParams params,
  });

}
