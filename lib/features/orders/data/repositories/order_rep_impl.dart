import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/exceptions.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/order_params.dart';
import 'package:tsh_soft/features/orders/data/datasources/order_remote_data_source.dart';
import 'package:tsh_soft/features/orders/data/models/order_resp_model.dart';
import 'package:tsh_soft/features/orders/domain/repositories/order_repo.dart';
import 'package:tsh_soft/injection_container.dart';

class OrdersRepositoryImpl extends OrdersRepository {
  final OrdersRemoteDataSource ordersRemoteDataSource;

  OrdersRepositoryImpl({required this.ordersRemoteDataSource});

  @override
  Future<Either<Failure, GetOrdersRespModel>> getOrders(
      {required OrderParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await ordersRemoteDataSource.getOrders(params: params);
        return Right(response);
      } on AppException catch (error) {
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, BaseOneResponse>> createOrder(
      {required OrderParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await ordersRemoteDataSource.createOrder(params: params);
        return Right(response);
      } on AppException catch (error) {
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }
}
