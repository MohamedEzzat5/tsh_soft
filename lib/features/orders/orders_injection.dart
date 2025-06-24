import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/features/orders/data/datasources/order_remote_data_source.dart';
import 'package:tsh_soft/features/orders/data/repositories/order_rep_impl.dart';
import 'package:tsh_soft/features/orders/domain/repositories/order_repo.dart';
import 'package:tsh_soft/features/orders/domain/usecases/create_order_usecase.dart';
import 'package:tsh_soft/features/orders/domain/usecases/get_orders_use_cases.dart';
import 'package:tsh_soft/features/orders/presentation/cubit/create_order_cubit/create_order_cubit.dart';
import 'package:tsh_soft/features/orders/presentation/cubit/get_orders_cubit/get_orders_cubit.dart';

import '../../injection_container.dart';

final _sl = ServiceLocator.instance;

Future<void> initOrdersFeatureInjection() async {
  ///-> Cubit
  _sl.registerFactory<GetOrdersCubit>(
    () => GetOrdersCubit(getOrdersUseCase: _sl()),
  );
  _sl.registerFactory<CreateOrderCubit>(
    () => CreateOrderCubit(createOrderUseCase: _sl()),
  );

  ///-> UseCase
  _sl.registerLazySingleton<GetOrdersUseCase>(
    () => GetOrdersUseCase(ordersRepository: _sl()),
  );
  _sl.registerLazySingleton<CreateOrderUseCase>(
    () => CreateOrderUseCase(ordersRepository: _sl()),
  );

  ///-> Repository
  _sl.registerLazySingleton<OrdersRepository>(
    () => OrdersRepositoryImpl(ordersRemoteDataSource: _sl()),
  );

  ///-> DataSource
  _sl.registerLazySingleton<OrdersRemoteDataSource>(
    () => OrdersRemoteDataSourceImpl(),
  );
}

///-> BlocProvider
List<BlocProvider> get ordersBlocs => <BlocProvider>[
      BlocProvider<GetOrdersCubit>(
        create: (BuildContext context) => _sl<GetOrdersCubit>(),
      ),
      BlocProvider<CreateOrderCubit>(
        create: (BuildContext context) => _sl<CreateOrderCubit>(),
      ),
    ];
