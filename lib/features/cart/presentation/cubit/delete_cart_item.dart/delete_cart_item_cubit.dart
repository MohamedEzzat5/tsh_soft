import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/cart_params.dart';
import 'package:tsh_soft/features/cart/domain/usecases/delete_cart_item_usecase.dart';

part 'delete_cart_item_state.dart';

class DeleteCartItemCubit extends Cubit<DeleteCartItemState> {
  final DeleteCartItemUseCase deleteCartItemUseCase;

  DeleteCartItemCubit({required this.deleteCartItemUseCase})
      : super(DeleteCartItemInitialState());

  Future<void> deleteCartItem({required CartParams params}) async {
    emit(DeleteCartItemLoadingState());
    final Either<Failure, BaseOneResponse> result =
        await deleteCartItemUseCase.call(params);

    result.fold(
      (failure) =>
          emit(DeleteCartItemFailureState(errorMessage: failure.message ?? '')),
      (response) => emit(DeleteCartItemSuccessState(resp: response)),
    );
  }
}
