import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/features/pages/data/datasources/pages_remote_data_source.dart';
import 'package:tsh_soft/features/pages/data/repositories/pages_repo_impl.dart';
import 'package:tsh_soft/features/pages/domain/repositories/pages_repo.dart';
import 'package:tsh_soft/features/pages/domain/usecases/get_page_usecase.dart';
import 'package:tsh_soft/features/pages/presentation/cubit/get_page_cubit.dart';

import '../../injection_container.dart';

final _sl = ServiceLocator.instance;

Future<void> initPagesFeatureInjection() async {
  ///-> Cubit
  _sl.registerFactory<GetPageCubit>(
    () => GetPageCubit(getPageUseCase: _sl()),
  );

  ///-> UseCase
  _sl.registerLazySingleton<GetPageUseCase>(
    () => GetPageUseCase(pagesRepository: _sl()),
  );

  ///-> Repository
  _sl.registerLazySingleton<PagesRepository>(
    () => PagesRepositoryImpl(pagesRemoteDataSource: _sl()),
  );

  ///-> DataSource
  _sl.registerLazySingleton<PagesRemoteDataSource>(
    () => PagesRemoteDataSourceImpl(),
  );
}

///-> BlocProvider
List<BlocProvider> get pagesBlocs => <BlocProvider>[
      BlocProvider<GetPageCubit>(
        create: (BuildContext context) => _sl<GetPageCubit>(),
      ),
    ];
