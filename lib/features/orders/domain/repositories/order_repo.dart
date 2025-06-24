import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/order_params.dart';

abstract class OrdersRepository {
  Future<Either<Failure, BaseListResponse>> getOrders(
      {required OrderParams params});

        Future<Either<Failure, BaseOneResponse>> createOrder(
      {required OrderParams params});

}


