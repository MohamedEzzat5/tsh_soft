import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/cart_params.dart';
import 'package:tsh_soft/features/cart/domain/usecases/add_to_cart_usecase.dart';

part 'add_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  final AddToCartUseCase addToCartUseCase;

  AddToCartCubit({required this.addToCartUseCase}) : super(AddToCartInitialState());

  Future<void> addToCart({required CartParams params}) async {
    emit(AddToCartLoadingState());
    final Either<Failure, BaseOneResponse> result =
        await addToCartUseCase.call(params);

    result.fold(
      (failure) =>
          emit(AddToCartFailureState(errorMessage: failure.message ?? '')),
      (response) => emit(AddToCartSuccessState(resp: response)),
    );
  }
}
