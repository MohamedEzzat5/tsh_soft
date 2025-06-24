import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/core/params/product_params.dart';
import 'package:tsh_soft/features/products/domain/usecases/get_products_usecase.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  final GetProductsUseCase getProductsUseCase;

  GetProductsCubit({required this.getProductsUseCase})
      : super(GetProductsInitial());

  Future<void> getProducts({ required ProductsParams params}) async {
    emit(GetProductsLoading());
    try {
      final result = await getProductsUseCase.call(params);
      emit(result.fold(
          (failure) => GetProductsError(
              message: failure.message ?? 'Unable to get products'),
          (response) => GetProductsSuccess(response: response)));
    } catch (e) {
      emit(GetProductsError(message: e.toString()));
    }
  }
}
