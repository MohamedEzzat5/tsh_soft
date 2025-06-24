import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/cart/domain/usecases/get_cart_usecase.dart';

part 'get_cart_state.dart';

class GetCartCubit extends Cubit<GetCartState> {
  final GetCartUseCase getCartUseCase;

  GetCartCubit({required this.getCartUseCase}) : super(GetCartInitialState());

  Future<void> getCart() async {
    emit(GetCartLoadingState());
    final Either<Failure, BaseOneResponse> result =
        await getCartUseCase.call(NoParams());

    result.fold(
      (failure) =>
          emit(GetCartFailureState(errorMessage: failure.message ?? '')),
      (response) => emit(GetCartSuccessState(resp: response)),
    );
  }
}
