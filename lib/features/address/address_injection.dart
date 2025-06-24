import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/features/address/data/repository_impl/address_repositry_impl.dart';
import 'package:tsh_soft/features/address/domain/repository/address_repositry.dart';
import 'package:tsh_soft/features/address/domain/usecase/add_address_usecase.dart';
import 'package:tsh_soft/features/address/domain/usecase/get_addresses_usecase.dart';
import 'package:tsh_soft/features/address/presentation/cubit/add_new_address_cubit/add_new_address_cubit.dart';
import 'package:tsh_soft/features/address/presentation/cubit/delete_address_cubit/delete_address_cubit.dart';
import 'package:tsh_soft/features/address/presentation/cubit/get_address_cubit/get_address_cubit.dart';

import '../../injection_container.dart';
import 'data/data_source/address_remote_data_source.dart';
import 'domain/usecase/delete_address_use_case.dart';

final _sl = ServiceLocator.instance;

Future<void> initAddressFeatureInjection() async {
  ///-> Cubits
  _sl.registerFactory<AddNewAddressCubit>(() => AddNewAddressCubit(
        addLocationsUseCase: _sl(),
      ));

  _sl.registerLazySingleton<DeleteAddressCubit>(
      () => DeleteAddressCubit(deleteLocationUseCase: _sl()));

  _sl.registerLazySingleton<GetAddressesCubit>(() => GetAddressesCubit(
        getAddedLocationsUseCase: _sl(),
      ));

  ///-> UseCases
  _sl.registerLazySingleton<GetAddressesUseCase>(
      () => GetAddressesUseCase(locationRepository: _sl()));

  _sl.registerLazySingleton<AddAddressUseCase>(
      () => AddAddressUseCase(locationRepository: _sl()));

  _sl.registerLazySingleton<DeleteAddressUseCase>(
      () => DeleteAddressUseCase(locationRepository: _sl()));

  ///-> Repository
  _sl.registerLazySingleton<AddressRepository>(
      () => AddressRepositoryImpl(addressRemoteDataSource: _sl()));

  ///-> DataSource
  _sl.registerLazySingleton<AddressRemoteDataSource>(
      () => LocationRemoteDataSourceImpl());
}

///-> BlocProvider
List<BlocProvider> get addressBlocs => <BlocProvider>[
      BlocProvider<AddNewAddressCubit>(
        create: (BuildContext context) => _sl<AddNewAddressCubit>(),
      ),
      BlocProvider<DeleteAddressCubit>(
        create: (BuildContext context) => _sl<DeleteAddressCubit>(),
      ),
      BlocProvider<GetAddressesCubit>(
        create: (BuildContext context) => _sl<GetAddressesCubit>(),
      ),
    ];
