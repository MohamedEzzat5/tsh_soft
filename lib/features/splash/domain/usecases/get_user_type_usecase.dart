import 'package:dartz/dartz.dart';
import 'package:tsh_soft/features/splash/domain/repositories/splash_repo.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/enums.dart';


class GetUserTypeUseCase extends UseCase<UserType, NoParams> {
  final SplashRepository repository;

  GetUserTypeUseCase({required this.repository});

  @override
  Future<Either<Failure, UserType>> call(NoParams params) async {
    return await repository.getUserType(params: params);
  }
}




