import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/features/products/data/datasources/products_remote_data_source.dart';
import 'package:tsh_soft/features/products/data/repositories/products_repo_impl.dart';
import 'package:tsh_soft/features/products/domain/repositories/products_repo.dart';
import 'package:tsh_soft/features/products/domain/usecases/get_product_details.dart';
import 'package:tsh_soft/features/products/domain/usecases/get_products_usecase.dart';
import 'package:tsh_soft/features/products/presentation/cubit/get_product_details_cubit/get_product_details_cubit.dart';
import 'package:tsh_soft/features/products/presentation/cubit/get_products_cubit/get_products_cubit.dart';
import 'package:tsh_soft/injection_container.dart';

final _sl = ServiceLocator.instance;

Future<void> initProductsFeatureInjection() async {
  ///-> Cubits
    _sl.registerLazySingleton<GetProductDetailsCubit>(
      () => GetProductDetailsCubit(getProductDetailsUseCase: _sl()));

    _sl.registerLazySingleton<GetProductsCubit>(
      () => GetProductsCubit(getProductsUseCase: _sl()));

  ///-> UseCases
  _sl.registerLazySingleton<GetProductDetailsUseCase>(
      () => GetProductDetailsUseCase(repository: _sl()));

  _sl.registerLazySingleton<GetProductsUseCase>(
      () => GetProductsUseCase(repository: _sl()));

  ///-> Repository
  _sl.registerLazySingleton<ProductsRepository>(() => ProductsRepoImpl(remote: _sl()));

  ///-> DataSource
  _sl.registerLazySingleton<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSourceImpl());
}

///-> BlocProvider
List<BlocProvider> get productsBlocs => <BlocProvider>[
      BlocProvider<GetProductDetailsCubit>(
        create: (BuildContext context) => _sl<GetProductDetailsCubit>(),
      ),
      BlocProvider<GetProductsCubit>(
        create: (BuildContext context) => _sl<GetProductsCubit>(),
      ),
    ];
