import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/features/splash/data/repositories/splash_repo_impl.dart';
import 'package:tsh_soft/features/splash/domain/repositories/splash_repo.dart';
import 'package:tsh_soft/features/splash/domain/usecases/get_user_type_usecase.dart';
import 'package:tsh_soft/features/splash/domain/usecases/save_user_type_usecase.dart';
import 'package:tsh_soft/features/splash/presentation/cubit/auto_login/auto_login_cubit.dart';

import '../../injection_container.dart';

final _sl = ServiceLocator.instance;

Future<void> initSplashFeatureInjection() async {
  /// Cubits
   _sl.registerLazySingleton<AutoLoginCubit>(() => AutoLoginCubit(
        getUserTypeUseCase: _sl(),
        saveUserTypeUseCase: _sl(),
      ));

  /// UseCases
  _sl.registerLazySingleton<GetUserTypeUseCase>(
      () => GetUserTypeUseCase(repository: _sl()));

  _sl.registerLazySingleton<SaveUserTypeUseCase>(
      () => SaveUserTypeUseCase(repository: _sl()));
  /// Repository
   _sl.registerLazySingleton<SplashRepository>(
      () => SplalashRepoImpl());
}

/// BlocProviders
List<BlocProvider<StateStreamableSource<Object?>>> get splashBlocs =>
    <BlocProvider<StateStreamableSource<Object?>>>[
       BlocProvider<AutoLoginCubit>(
        create: (BuildContext context) => _sl<AutoLoginCubit>(),
      ),
    ];
