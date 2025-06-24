import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/order_params.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/orders/domain/repositories/order_repo.dart';

class CreateOrderUseCase extends UseCase<BaseOneResponse, OrderParams> {
  final OrdersRepository ordersRepository;

  CreateOrderUseCase({required this.ordersRepository});

  @override
  Future<Either<Failure, BaseOneResponse>> call(OrderParams params) =>
      ordersRepository.createOrder(params: params);
}
