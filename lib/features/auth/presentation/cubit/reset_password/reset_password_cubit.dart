import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/auth_params.dart';
import 'package:tsh_soft/features/auth/domain/usecases/reset_password_usecase.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordCubit({required this.resetPasswordUseCase})
      : super(ResetPasswordInitialState());

  Future<void> resetPassword(AuthParams params) async {
    emit(ResetPasswordLoadingState());
    final Either<Failure, BaseOneResponse> result =
        await resetPasswordUseCase.call(params);
    result.fold(
      (failure) =>
          emit(ResetPasswordFailureState(errorMessage: failure.message ?? '')),
      (response) => emit(ResetPasswordSuccessState(resp: response)),
    );
  }
}
