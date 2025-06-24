import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/auth_params.dart';
import 'package:tsh_soft/features/auth/domain/usecases/verify_otp_usecase.dart';


part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final VerifyOtpUseCase verifyOtpUseCase;

  VerifyOtpCubit({required this.verifyOtpUseCase})
      : super(VerifyOtpInitialState());

  Future<void> verifyOtp(AuthParams params) async {
    emit(VerifyOtpLoadingState());
    final Either<Failure, BaseOneResponse> result =
        await verifyOtpUseCase.call(params);
    result.fold(
      (failure) =>
          emit(VerifyOtpFailureState(errorMessage: failure.message ?? '')),
      (response) => emit(VerifyOtpSuccessState(resp: response)),
    );
  }
}
