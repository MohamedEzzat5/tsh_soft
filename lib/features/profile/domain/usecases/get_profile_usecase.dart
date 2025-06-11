import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/profile/domain/repositories/profile_repo.dart';

class GetProfileUseCase extends UseCase<BaseOneResponse, NoParams> {
  final ProfileRepository repository;

  GetProfileUseCase({required this.repository});

  @override
  Future<Either<Failure, BaseOneResponse>> call(NoParams params) {
    return repository.getProfileRepo();
  }
}
