import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/order_params.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/orders/domain/repositories/order_repo.dart';

class GetOrdersUseCase extends UseCase<BaseListResponse, OrderParams> {
  final OrdersRepository ordersRepository;

  GetOrdersUseCase({required this.ordersRepository});

  @override
  Future<Either<Failure, BaseListResponse>> call(OrderParams params) =>
      ordersRepository.getOrders(params: params);
}
