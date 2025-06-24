import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/order_params.dart';
import 'package:tsh_soft/features/orders/domain/usecases/create_order_usecase.dart';

part 'create_order_state.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  final CreateOrderUseCase createOrderUseCase;

  CreateOrderCubit({required this.createOrderUseCase})
      : super(CreateOrderInitialState());

  Future<void> createOrder({required OrderParams params}) async {
    emit(CreateOrderLoadingState());
    final Either<Failure, BaseOneResponse> result =
        await createOrderUseCase.call(params);
    result.fold(
      (failure) =>
          emit(CreateOrderFailureState(errorMessage: failure.message ?? '')),
      (response) => emit(CreateOrderSuccessState(resp: response)),
    );
  }
}
