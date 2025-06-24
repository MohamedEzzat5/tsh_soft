import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/order_params.dart';
import 'package:tsh_soft/features/orders/domain/usecases/get_orders_use_cases.dart';


part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  final GetOrdersUseCase getOrdersUseCase;

  GetOrdersCubit({required this.getOrdersUseCase})
      : super(GetOrdersInitialState());

  Future<void> getOrders(OrderParams params) async {
    emit(GetOrdersLoadingState());
    final Either<Failure, BaseListResponse> result =
        await getOrdersUseCase.call(params);
    result.fold(
      (failure) =>
          emit(GetOrdersFailureState(errorMessage: failure.message ?? '')),
      (response) => emit(GetOrdersSuccessState(resp: response)),
    );
  }
}