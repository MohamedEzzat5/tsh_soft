import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/params/auth_params.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/login_email_usecase.dart';

part 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(const LoginInitialState());

  Future<void> login({required AuthParams params}) async {
    try {
      emit(LoginLoadingState());
      final Either<Failure, BaseOneResponse> eitherResult =
          await loginUseCase.call(params);
      eitherResult.fold((Failure failure) {
        emit(LoginFailureState(
            message: failure.message ?? "Please try again later"));
      }, (response) {
        emit(LoginSuccessState(resp: response));
      });
    } catch (e) {
      emit(LoginFailureState(message: e.toString()));
    }
  }
}
