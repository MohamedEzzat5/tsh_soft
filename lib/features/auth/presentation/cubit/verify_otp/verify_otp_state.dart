part of 'verify_otp_cubit.dart';

sealed class VerifyOtpState extends Equatable {
  const VerifyOtpState();

  @override
  List<Object?> get props => [];
}

class VerifyOtpInitialState extends VerifyOtpState {}

class VerifyOtpLoadingState extends VerifyOtpState {}

class VerifyOtpSuccessState extends VerifyOtpState {
  final BaseOneResponse resp;

  const VerifyOtpSuccessState({required this.resp});

  @override
  List<Object?> get props => [resp];
}

class VerifyOtpFailureState extends VerifyOtpState {
  final String errorMessage;

  const VerifyOtpFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
