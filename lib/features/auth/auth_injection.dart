import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:tsh_soft/features/auth/domain/usecases/delete_account_usecase.dart';
import 'package:tsh_soft/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:tsh_soft/features/auth/domain/usecases/logout_usecase.dart';
import 'package:tsh_soft/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:tsh_soft/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:tsh_soft/features/auth/presentation/cubit/delete_account_cubit/delete_account_cubit.dart';
import 'package:tsh_soft/features/auth/presentation/cubit/forget_password/forgot_password_cubit.dart';
import 'package:tsh_soft/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:tsh_soft/features/auth/presentation/cubit/logout/logout_cubit.dart';
import 'package:tsh_soft/features/auth/presentation/cubit/reset_password/reset_password_cubit.dart';
import 'package:tsh_soft/features/auth/presentation/cubit/verify_otp/verify_otp_cubit.dart';

import '../../injection_container.dart';
import 'data/repositories/auth_repo_impl.dart';
import 'domain/repositories/auth_repo.dart';
import 'domain/usecases/login_email_usecase.dart';
import 'domain/usecases/register_usecase.dart';
import 'presentation/cubit/register/register_cubit.dart';

final _sl = ServiceLocator.instance;

Future<void> initAuthFeatureInjection() async {
  ///-> Cubits

  _sl.registerFactory<LogoutCubit>(() => LogoutCubit(_sl()));

  _sl.registerFactory<DeleteAccountCubit>(
      () => DeleteAccountCubit(deleteAccountUseCase: _sl()));

  _sl.registerFactory<LoginCubit>(() => LoginCubit(_sl()));

  _sl.registerFactory<RegisterCubit>(() => RegisterCubit(_sl()));

  _sl.registerFactory<ForgotPasswordCubit>(
    () => ForgotPasswordCubit(forgotPasswordUseCase: _sl()),
  );
  _sl.registerFactory<VerifyOtpCubit>(
    () => VerifyOtpCubit(verifyOtpUseCase: _sl()),
  );

  _sl.registerFactory<ResetPasswordCubit>(
    () => ResetPasswordCubit(resetPasswordUseCase: _sl()),
  );

  ///-> UseCase
  _sl.registerLazySingleton<ForgotPasswordUseCase>(
    () => ForgotPasswordUseCase(authRepository: _sl()),
  );
  _sl.registerLazySingleton<VerifyOtpUseCase>(
    () => VerifyOtpUseCase(authRepository: _sl()),
  );

  _sl.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(repository: _sl()));

  _sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(repository: _sl()));

  _sl.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(repository: _sl()));

  _sl.registerLazySingleton<DeleteAccountUseCase>(
      () => DeleteAccountUseCase(repository: _sl()));

  _sl.registerLazySingleton<ResetPasswordUseCase>(
    () => ResetPasswordUseCase(authRepository: _sl()),
  );

  ///-> Repository
  _sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remote: _sl()));

  ///-> DataSource
  _sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());
}

///-> BlocProvider
List<BlocProvider> get authBlocs => <BlocProvider>[
      BlocProvider<RegisterCubit>(
        create: (BuildContext context) => _sl<RegisterCubit>(),
      ),
      BlocProvider<LoginCubit>(
        create: (BuildContext context) => _sl<LoginCubit>(),
      ),
      BlocProvider<ForgotPasswordCubit>(
        create: (BuildContext context) => _sl<ForgotPasswordCubit>(),
      ),
      BlocProvider<VerifyOtpCubit>(
        create: (BuildContext context) => _sl<VerifyOtpCubit>(),
      ),
      BlocProvider<ResetPasswordCubit>(
        create: (BuildContext context) => _sl<ResetPasswordCubit>(),
      ),
      BlocProvider<LogoutCubit>(
        create: (BuildContext context) => _sl<LogoutCubit>(),
      ),
      BlocProvider<DeleteAccountCubit>(
        create: (BuildContext context) => _sl<DeleteAccountCubit>(),
      ),
    ];
