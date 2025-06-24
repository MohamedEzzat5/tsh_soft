import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/error/exceptions.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/page_params.dart';
import 'package:tsh_soft/features/pages/data/datasources/pages_remote_data_source.dart';
import 'package:tsh_soft/features/pages/data/models/page_resp_model.dart';
import 'package:tsh_soft/features/pages/domain/repositories/pages_repo.dart';
import 'package:tsh_soft/injection_container.dart';

class PagesRepositoryImpl extends PagesRepository {
  final PagesRemoteDataSource pagesRemoteDataSource;

  PagesRepositoryImpl({required this.pagesRemoteDataSource});

  @override
  Future<Either<Failure, GetPageRespModel>> getPage(
      {required PageParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await pagesRemoteDataSource.getPage(params: params);
        return Right(response);
      } on AppException catch (error) {
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }
}
