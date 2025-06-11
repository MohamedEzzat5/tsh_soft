import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:tsh_soft/features/profile/data/repositories/profile_repo_impl.dart';
import 'package:tsh_soft/features/profile/domain/repositories/profile_repo.dart';
import 'package:tsh_soft/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:tsh_soft/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:tsh_soft/features/profile/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:tsh_soft/features/profile/presentation/cubit/update_profile/update_profile_cubit.dart';
import 'package:tsh_soft/injection_container.dart';

final _sl = ServiceLocator.instance;

Future<void> initProfileFeatureInjection() async {
  ///-> Cubits

  _sl.registerLazySingleton<ProfileCubit>(
      () => ProfileCubit(getProfileUseCase: _sl()));
  _sl.registerLazySingleton<UpdateProfileCubit>(
      () => UpdateProfileCubit(updateProfileUseCase: _sl()));

  ///-> UseCases
  _sl.registerLazySingleton<GetProfileUseCase>(
      () => GetProfileUseCase(repository: _sl()));

  _sl.registerLazySingleton<UpdateProfileUseCase>(
      () => UpdateProfileUseCase(repository: _sl()));

  ///-> Repository
  _sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(remote: _sl()));

  ///-> DataSource
  _sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl());
}

///-> BlocProvider
List<BlocProvider> get profileBlocs => <BlocProvider>[
      BlocProvider<ProfileCubit>(
        create: (BuildContext context) => _sl<ProfileCubit>(),
      ),
      BlocProvider<UpdateProfileCubit>(
        create: (BuildContext context) => _sl<UpdateProfileCubit>(),
      ),
    ];
