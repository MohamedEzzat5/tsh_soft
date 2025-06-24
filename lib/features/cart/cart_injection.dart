import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:tsh_soft/features/cart/data/repositories/cart_repo_impl.dart';
import 'package:tsh_soft/features/cart/domain/repositories/cart_repo.dart';
import 'package:tsh_soft/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:tsh_soft/features/cart/domain/usecases/delete_cart_item_usecase.dart';
import 'package:tsh_soft/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:tsh_soft/features/cart/domain/usecases/update_cart_item_usecase.dart';
import 'package:tsh_soft/features/cart/presentation/cubit/add_to_cart_cubit/add_cart_cubit.dart';
import 'package:tsh_soft/features/cart/presentation/cubit/delete_cart_item.dart/delete_cart_item_cubit.dart';
import 'package:tsh_soft/features/cart/presentation/cubit/get_cart/get_cart_cubit.dart';
import 'package:tsh_soft/features/cart/presentation/cubit/update_cart_item_cubit/update_cart_item_cubit.dart';

import '../../injection_container.dart';

final _sl = ServiceLocator.instance;

Future<void> initCartFeatureInjection() async {
  ///-> Cubit
  _sl.registerFactory<GetCartCubit>(
    () => GetCartCubit(getCartUseCase: _sl()),
  );
  _sl.registerFactory<AddToCartCubit>(
    () => AddToCartCubit(addToCartUseCase: _sl()),
  );
  _sl.registerFactory<UpdateCartItemCubit>(
    () => UpdateCartItemCubit(updateCartItemUseCase: _sl()),
  );
  _sl.registerFactory<DeleteCartItemCubit>(
    () => DeleteCartItemCubit(deleteCartItemUseCase: _sl()),
  );

  ///-> UseCase
  _sl.registerLazySingleton<GetCartUseCase>(
    () => GetCartUseCase(cartRepository: _sl()),
  );

  _sl.registerLazySingleton<UpdateCartItemUseCase>(
    () => UpdateCartItemUseCase(cartRepository: _sl()),
  );

  _sl.registerLazySingleton<DeleteCartItemUseCase>(
    () => DeleteCartItemUseCase(cartRepository: _sl()),
  );

  _sl.registerLazySingleton<AddToCartUseCase>(
    () => AddToCartUseCase(cartRepository: _sl()),
  );

  ///-> Repository
  _sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(cartRemoteDataSource: _sl()),
  );

  ///-> DataSource
  _sl.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(),
  );
}

///-> BlocProvider
List<BlocProvider> get cartBlocs => <BlocProvider>[
      BlocProvider<AddToCartCubit>(
        create: (BuildContext context) => _sl<AddToCartCubit>(),
      ),
      BlocProvider<GetCartCubit>(
        create: (BuildContext context) => _sl<GetCartCubit>(),
      ),
      BlocProvider<UpdateCartItemCubit>(
        create: (BuildContext context) => _sl<UpdateCartItemCubit>(),
      ),
      BlocProvider<DeleteCartItemCubit>(
        create: (BuildContext context) => _sl<DeleteCartItemCubit>(),
      ),
    ];
