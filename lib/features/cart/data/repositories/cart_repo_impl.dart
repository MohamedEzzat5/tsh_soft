import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/exceptions.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/cart_params.dart';
import 'package:tsh_soft/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:tsh_soft/features/cart/data/models/cart_resp_model.dart';
import 'package:tsh_soft/features/cart/domain/repositories/cart_repo.dart';
import 'package:tsh_soft/injection_container.dart';

class CartRepositoryImpl extends CartRepository {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failure, MainCartRespModel>> getCart(
      ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await cartRemoteDataSource.getCart();
        return Right(response);
      } on AppException catch (error) {
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, MainCartRespModel>> addToCart(
      {required CartParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await cartRemoteDataSource.addToCart(params: params);
        return Right(response);
      } on AppException catch (error) {
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, BaseOneResponse>> deleteCartItem({required CartParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await cartRemoteDataSource.deleteCartItem(params: params);
        return Right(response);
      } on AppException catch (error) {
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, BaseOneResponse>> updateCartItem({required CartParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await cartRemoteDataSource.updateCartItem(params: params);
        return Right(response);
      } on AppException catch (error) {
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }
}
