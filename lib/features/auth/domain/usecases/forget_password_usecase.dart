import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/auth_params.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/auth/domain/repositories/auth_repo.dart';

class ForgotPasswordUseCase extends UseCase<BaseOneResponse, AuthParams> {
  final AuthRepository authRepository;

  ForgotPasswordUseCase({required this.authRepository});

  @override
  Future<Either<Failure, BaseOneResponse>> call(AuthParams params) =>
      authRepository.forgotPassword(params: params);
}
