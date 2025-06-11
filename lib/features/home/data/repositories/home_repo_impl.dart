import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/core/error/exceptions.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/features/home/data/datasources/home_remote_data_source.dart';
import 'package:tsh_soft/features/home/domain/repositories/home_repo.dart';
import 'package:tsh_soft/injection_container.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remote;

  HomeRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, BaseListResponse>> getCategoriesRepo() async {
    if (await networkInfo.isConnected) {
      try {
        final BaseListResponse response = await remote.getCategories();
        return Right(response);
      } on AppException catch (e) {
        return Left(e.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: 'No internet connection'));
    }
  }
}
