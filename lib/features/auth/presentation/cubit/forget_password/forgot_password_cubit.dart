import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/auth_params.dart';
import 'package:tsh_soft/features/auth/domain/usecases/forget_password_usecase.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordUseCase forgotPasswordUseCase;

  ForgotPasswordCubit({required this.forgotPasswordUseCase})
      : super(ForgotPasswordInitialState());

  Future<void> forgotPassword({required AuthParams params}) async {
    emit(ForgotPasswordLoadingState());
    final Either<Failure, BaseOneResponse> result =
        await forgotPasswordUseCase.call(params);
    result.fold(
      (failure) =>
          emit(ForgotPasswordFailureState(errorMessage: failure.message ?? '')),
      (response) => emit(ForgotPasswordSuccessState(resp: response)),
    );
  }
}
