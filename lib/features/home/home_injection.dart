import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/features/home/data/datasources/home_remote_data_source.dart';
import 'package:tsh_soft/features/home/data/repositories/home_repo_impl.dart';
import 'package:tsh_soft/features/home/domain/repositories/home_repo.dart';
import 'package:tsh_soft/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:tsh_soft/features/home/domain/usecases/get_slider_usecase.dart';
import 'package:tsh_soft/features/home/presentation/cubit/category_cubit/category_cubit.dart';
import 'package:tsh_soft/features/home/presentation/cubit/slider_cubit/get_sliders_cubit.dart';
import 'package:tsh_soft/injection_container.dart';

final _sl = ServiceLocator.instance;

Future<void> inithomeFeatureInjection() async {
  ///-> Cubits

  _sl.registerFactory<CategoryCubit>(
      () => CategoryCubit(getCategoriesUseCase: _sl()));

  _sl.registerFactory<GetSlidersCubit>(
    () => GetSlidersCubit(getSlidersUseCase: _sl()),
  );

  ///-> UseCase
  _sl.registerLazySingleton<GetSlidersUseCase>(
    () => GetSlidersUseCase(homeRepository: _sl()),
  );
 
  _sl.registerLazySingleton<GetCategoriesUseCase>(
      () => GetCategoriesUseCase(repository: _sl()));

  ///-> Repository
  _sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remote: _sl()));

  ///-> DataSource
  _sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl());
}

///-> BlocProvider
List<BlocProvider> get homeBlocs => <BlocProvider>[
      BlocProvider<CategoryCubit>(
        create: (BuildContext context) => _sl<CategoryCubit>(),
      ),
      BlocProvider<GetSlidersCubit>(
        create: (BuildContext context) => _sl<GetSlidersCubit>(),
      ),
    ];
