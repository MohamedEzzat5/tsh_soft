part of 'forgot_password_cubit.dart';

sealed class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object?> get props => [];
}

class ForgotPasswordInitialState extends ForgotPasswordState {}

class ForgotPasswordLoadingState extends ForgotPasswordState {}

class ForgotPasswordSuccessState extends ForgotPasswordState {
  final BaseOneResponse resp;

  const ForgotPasswordSuccessState({required this.resp});

  @override
  List<Object?> get props => [resp];
}

class ForgotPasswordFailureState extends ForgotPasswordState {
  final String errorMessage;

  const ForgotPasswordFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
