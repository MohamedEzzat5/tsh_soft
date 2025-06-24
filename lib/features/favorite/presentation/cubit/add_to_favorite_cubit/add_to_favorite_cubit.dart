import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tsh_soft/core/params/product_params.dart';
import 'package:tsh_soft/features/favorite/domain/usecases/add_to_favorite_use_case.dart';

part 'add_to_favorite_state.dart';

class AddToFavoriteCubit extends Cubit<AddToFavoriteState> {
  final AddToFavoriteUseCase addToFavoriteUseCase;
  AddToFavoriteCubit({required this.addToFavoriteUseCase}) : super(AddToFavoriteState.initial());

Future<void> toggleFavorite(int productId) async {
    emit(state.copyWithLoading(productId, true));

    try {
   
      final eitherResult = await addToFavoriteUseCase(
        ProductsParams(id: productId),
      );

      eitherResult.fold(
        (failure) {
          
        },
        (response) {
          final current = state.favorites[productId] ?? false;
          emit(state.copyWithFavorite(productId, !current));
        },
      );
    } catch (e) {
    } finally {
      emit(state.copyWithLoading(productId, false));
    }
  }
}
