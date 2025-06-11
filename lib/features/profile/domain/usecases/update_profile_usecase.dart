import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/update_profile_params.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/profile/domain/repositories/profile_repo.dart';

class UpdateProfileUseCase
    extends UseCase<BaseOneResponse, UpdateProfileParams> {
  final ProfileRepository repository;

  UpdateProfileUseCase({required this.repository});

  @override
  Future<Either<Failure, BaseOneResponse>> call(UpdateProfileParams params) {
    return repository.updateProfileRepo(params: params);
  }
}
