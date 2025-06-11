import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:tsh_soft/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import '../../injection_container.dart';
import 'data/repositories/auth_repo_impl.dart';
import 'domain/repositories/auth_repo.dart';
import 'domain/usecases/register_usecase.dart';
import 'presentation/cubit/register/register_cubit.dart';
import 'domain/usecases/login_email_usecase.dart';


final _sl = ServiceLocator.instance;

Future<void> initAuthFeatureInjection() async {
  ///-> Cubits
  // _sl.registerLazySingleton<ConfirmResetPasswordCubit>(
  //     () => ConfirmResetPasswordCubit(_sl()));
  // _sl.registerLazySingleton<VerifyResetPasswordCubit>(
  //     () => VerifyResetPasswordCubit(_sl()));
  // _sl.registerLazySingleton<ResetPasswordCubit>(
  //     () => ResetPasswordCubit(_sl()));
  // _sl.registerLazySingleton<LogoutCubit>(() => LogoutCubit(_sl()));
  // _sl.registerLazySingleton<DeleteAccountCubit>(
  //     () => DeleteAccountCubit(_sl()));

  _sl.registerLazySingleton<LoginCubit>(() => LoginCubit(_sl()));
  _sl.registerLazySingleton<RegisterCubit>(() => RegisterCubit(_sl()));
  // _sl.registerLazySingleton<VerifyEmailCubit>(() => VerifyEmailCubit(_sl()));
  // _sl.registerLazySingleton<CheckMobileCubit>(() => CheckMobileCubit(_sl()));
  // _sl.registerLazySingleton<VerifyOtpCubit>(() => VerifyOtpCubit(_sl()));


  ///-> UseCases
  // _sl.registerLazySingleton<ConfirmResetPasswordUseCase>(
  //     () => ConfirmResetPasswordUseCase(repository: _sl()));
  // _sl.registerLazySingleton<VerifyResetPasswordUseCase>(
  //     () => VerifyResetPasswordUseCase(repository: _sl()));
  // _sl.registerLazySingleton<ResetPasswordUseCase>(
  //     () => ResetPasswordUseCase(repository: _sl()));
  // _sl.registerLazySingleton<LogoutUseCase>(
  //     () => LogoutUseCase(repository: _sl()));
  // _sl.registerLazySingleton<DeleteAccountUseCase>(
  //     () => DeleteAccountUseCase(repository: _sl()));
  _sl.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(repository: _sl()));
  _sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(repository: _sl()));


  ///-> Repository
  _sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remote: _sl()));

  ///-> DataSource
  _sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());
}

///-> BlocProvider
List<BlocProvider> get authBlocs => <BlocProvider>[
      // BlocProvider<DeleteAccountCubit>(
      //   create: (BuildContext context) => _sl<DeleteAccountCubit>(),
      // ),
      // BlocProvider<VerifyResetPasswordCubit>(
      //   create: (BuildContext context) => _sl<VerifyResetPasswordCubit>(),
      // ),
      // BlocProvider<ResetPasswordCubit>(
      //   create: (BuildContext context) => _sl<ResetPasswordCubit>(),
      // ),
      // BlocProvider<ConfirmResetPasswordCubit>(
      //   create: (BuildContext context) => _sl<ConfirmResetPasswordCubit>(),
      // ),
      // BlocProvider<LogoutCubit>(
      //   create: (BuildContext context) => _sl<LogoutCubit>(),
      // ),
      BlocProvider<RegisterCubit>(
        create: (BuildContext context) => _sl<RegisterCubit>(),
      ),
      BlocProvider<LoginCubit>(
        create: (BuildContext context) => _sl<LoginCubit>(),
      ), 
    ];
