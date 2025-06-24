import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/cart_params.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/cart/domain/repositories/cart_repo.dart';

class UpdateCartItemUseCase extends UseCase<BaseOneResponse, CartParams> {
  final CartRepository cartRepository;

  UpdateCartItemUseCase({required this.cartRepository});

  @override
  Future<Either<Failure, BaseOneResponse>> call(CartParams params) =>
      cartRepository.updateCartItem(params: params);
}
