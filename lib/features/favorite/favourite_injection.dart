import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/features/favorite/data/datasources/favorite_remote_data_source.dart';
import 'package:tsh_soft/features/favorite/data/repositories/favourite_repo_impl.dart';
import 'package:tsh_soft/features/favorite/domain/repositories/favorite_repo.dart';
import 'package:tsh_soft/features/favorite/domain/usecases/add_to_favorite_use_case.dart';
import 'package:tsh_soft/features/favorite/domain/usecases/get_favourites_usecase.dart';
import 'package:tsh_soft/features/favorite/presentation/cubit/add_to_favorite_cubit/add_to_favorite_cubit.dart';
import 'package:tsh_soft/features/favorite/presentation/cubit/get_favorites_cubit/get_favorites_cubit.dart';
import 'package:tsh_soft/injection_container.dart';

final _sl = ServiceLocator.instance;

Future<void> initFavouriteFeatureInjection() async {
  ///-> Cubits

  _sl.registerFactory<AddToFavoriteCubit>(
      () => AddToFavoriteCubit(addToFavoriteUseCase: _sl()));

  _sl.registerFactory<GetFavoritesCubit>(
    () => GetFavoritesCubit(getFavoritesUseCase: _sl()),
  );

  ///-> UseCases
  _sl.registerLazySingleton<AddToFavoriteUseCase>(
      () => AddToFavoriteUseCase(favRepositry: _sl()));

  _sl.registerLazySingleton<GetFavoritesUseCase>(
    () => GetFavoritesUseCase(favoritesRepository: _sl()),
  );

  ///-> Repository
  _sl.registerLazySingleton<FavouriteRepo>(
      () => FavouriteRepoImpl(remote: _sl()));

  ///-> DataSource
  _sl.registerLazySingleton<FavoriteRemoteDataSource>(
      () => FavoriteRemoteDataSourceImpl());
}

///-> BlocProvider
List<BlocProvider> get favoriteBlocs => <BlocProvider>[
      BlocProvider<AddToFavoriteCubit>(
        create: (BuildContext context) => _sl<AddToFavoriteCubit>(),
      ),
      BlocProvider<GetFavoritesCubit>(
        create: (BuildContext context) => _sl<GetFavoritesCubit>(),
      ),
    ];
