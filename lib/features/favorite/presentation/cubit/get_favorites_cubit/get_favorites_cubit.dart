import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/favorite/domain/usecases/get_favourites_usecase.dart';

part 'get_favorites_state.dart';

class GetFavoritesCubit extends Cubit<GetFavoritesState> {
  final GetFavoritesUseCase getFavoritesUseCase;

  GetFavoritesCubit({required this.getFavoritesUseCase})
      : super(GetFavoritesInitialState());

  Future<void> getFavorites() async {
    emit(GetFavoritesLoadingState());
    final Either<Failure, BaseListResponse> result =
        await getFavoritesUseCase.call(NoParams());
    result.fold(
      (failure) =>
          emit(GetFavoritesFailureState(errorMessage: failure.message ?? '')),
      (response) => emit(GetFavoritesSuccessState(resp: response)),
    );
  }
}
