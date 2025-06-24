part of 'reset_password_cubit.dart';

sealed class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object?> get props => [];
}

class ResetPasswordInitialState extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordSuccessState extends ResetPasswordState {
  final BaseOneResponse resp;

  const ResetPasswordSuccessState({required this.resp});

  @override
  List<Object?> get props => [resp];
}

class ResetPasswordFailureState extends ResetPasswordState {
  final String errorMessage;

  const ResetPasswordFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
