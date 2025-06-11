part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => <Object?>[];
}

class LoginInitialState extends LoginState {
  const LoginInitialState();
}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final BaseOneResponse resp;

  const LoginSuccessState({required this.resp});

  @override
  List<Object?> get props => <Object?>[resp];
}

class LoginFailureState extends LoginState {
  final String message;

  const LoginFailureState({
    required this.message,
  });

  @override
  List<Object?> get props => <Object?>[message];
}
