import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/page_params.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/pages/domain/repositories/pages_repo.dart';


class GetPageUseCase extends UseCase<BaseOneResponse, PageParams> {
  final PagesRepository pagesRepository;

  GetPageUseCase({required this.pagesRepository});

  @override
  Future<Either<Failure, BaseOneResponse>> call(PageParams params) =>
      pagesRepository.getPage(params: params);
}
