import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/cart_params.dart';
import 'package:tsh_soft/features/cart/domain/usecases/update_cart_item_usecase.dart';

part 'update_cart_item_state.dart';

class UpdateCartItemCubit extends Cubit<UpdateCartItemState> {
  final UpdateCartItemUseCase updateCartItemUseCase;

  UpdateCartItemCubit({required this.updateCartItemUseCase})
      : super(UpdateCartItemInitialState());

  Future<void> updateCartItem({required CartParams params}) async {
    emit(UpdateCartItemLoadingState());
    final Either<Failure, BaseOneResponse> result =
        await updateCartItemUseCase.call(params);

    result.fold(
      (failure) =>
          emit(UpdateCartItemFailureState(errorMessage: failure.message ?? '')),
      (response) => emit(UpdateCartItemSuccessState(resp: response)),
    );
  }
}
