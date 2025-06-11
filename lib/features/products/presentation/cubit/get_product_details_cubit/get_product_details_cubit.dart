import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/params/product_params.dart';
import 'package:tsh_soft/features/products/domain/usecases/get_product_details.dart';

part 'get_product_details_state.dart';

class GetProductDetailsCubit extends Cubit<GetProductDetailsState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;
  GetProductDetailsCubit({required this.getProductDetailsUseCase})
      : super(GetProductDetailsInitial());

      
  Future<void> getProductDetails({required ProductsParams params}) async {
    emit(GetProductDetailsLoading());
    try {
      final result = await getProductDetailsUseCase.call(params);
      emit(result.fold(
          (failure) => GetProductDetailsError(
              message: failure.message ?? 'Unable to get products'),
          (response) => GetProductDetailsSuccess(response: response)));
    } catch (e) {
      emit(GetProductDetailsError(message: e.toString()));
    }
  }
}
