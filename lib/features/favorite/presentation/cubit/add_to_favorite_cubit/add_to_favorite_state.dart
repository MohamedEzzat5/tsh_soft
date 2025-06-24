part of 'add_to_favorite_cubit.dart';

class AddToFavoriteState extends Equatable {
  final Map<int, bool> favorites;
  final Map<int, bool> loadingIds;

  const AddToFavoriteState({
    required this.favorites,
    required this.loadingIds,
  });

  factory AddToFavoriteState.initial() => const AddToFavoriteState(
        favorites: {},
        loadingIds: {},
      );

  AddToFavoriteState copyWithFavorite(int productId, bool isFav) {
    final newFavs = Map<int, bool>.from(favorites)..[productId] = isFav;
    return AddToFavoriteState(
      favorites: newFavs,
      loadingIds: loadingIds,
    );
  }

  AddToFavoriteState copyWithLoading(int productId, bool isLoading) {
    final newLoading = Map<int, bool>.from(loadingIds)..[productId] = isLoading;
    return AddToFavoriteState(
      favorites: favorites,
      loadingIds: newLoading,
    );
  }

  AddToFavoriteState copyWithAll(Map<int, bool> favs) {
    return AddToFavoriteState(
      favorites: favs,
      loadingIds: {},
    );
  }

  bool isFavorite(int id) => favorites[id] ?? false;
  bool isLoading(int id) => loadingIds[id] ?? false;

  @override
  List<Object?> get props => [favorites, loadingIds];
}
