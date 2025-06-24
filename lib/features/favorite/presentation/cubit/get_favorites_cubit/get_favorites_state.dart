part of 'get_favorites_cubit.dart';

sealed class GetFavoritesState extends Equatable {
  const GetFavoritesState();

  @override
  List<Object?> get props => [];
}

class GetFavoritesInitialState extends GetFavoritesState {}

class GetFavoritesLoadingState extends GetFavoritesState {}

class GetFavoritesSuccessState extends GetFavoritesState {
  final BaseListResponse resp;

  const GetFavoritesSuccessState({required this.resp});

  @override
  List<Object?> get props => [resp];
}

class GetFavoritesFailureState extends GetFavoritesState {
  final String errorMessage;

  const GetFavoritesFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
