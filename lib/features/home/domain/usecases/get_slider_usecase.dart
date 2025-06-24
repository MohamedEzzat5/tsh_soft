import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/home/domain/repositories/home_repo.dart';

class GetSlidersUseCase extends UseCase<BaseListResponse, NoParams> {
  final HomeRepository homeRepository;

  GetSlidersUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, BaseListResponse>> call(NoParams params) =>
      homeRepository.getSliders();
}
