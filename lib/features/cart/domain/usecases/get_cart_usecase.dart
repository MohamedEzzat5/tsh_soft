import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/cart/domain/repositories/cart_repo.dart';

class GetCartUseCase extends UseCase<BaseOneResponse, NoParams> {
  final CartRepository cartRepository;

  GetCartUseCase({required this.cartRepository});

  @override
  Future<Either<Failure, BaseOneResponse>> call(NoParams params) =>
      cartRepository.getCart();
}
