part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => <Object?>[];
}

class RegisterInitialState extends RegisterState {
  const RegisterInitialState();
}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final BaseOneResponse? response;

  const RegisterSuccessState({required this.response});

  @override
  List<Object?> get props => <Object?>[response];
}

class RegisterFailureState extends RegisterState {
  final String errorMessage;

  const RegisterFailureState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => <Object?>[errorMessage];
}
