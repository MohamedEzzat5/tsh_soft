import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/cart_params.dart';

abstract class CartRepository {
  Future<Either<Failure, BaseOneResponse>> getCart();
  
  Future<Either<Failure, BaseOneResponse>> addToCart(
      {required CartParams params});

  Future<Either<Failure, BaseOneResponse>> updateCartItem(
      {required CartParams params});

  Future<Either<Failure, BaseOneResponse>> deleteCartItem(
      {required CartParams params});
}
