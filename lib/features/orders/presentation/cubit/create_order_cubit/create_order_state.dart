part of 'create_order_cubit.dart';

sealed class CreateOrderState extends Equatable {
  const CreateOrderState();

  @override
  List<Object?> get props => [];
}

class CreateOrderInitialState extends CreateOrderState {}

class CreateOrderLoadingState extends CreateOrderState {}

class CreateOrderSuccessState extends CreateOrderState {
  final BaseOneResponse resp;

  const CreateOrderSuccessState({required this.resp});

  @override
  List<Object?> get props => [resp];
}

class CreateOrderFailureState extends CreateOrderState {
  final String errorMessage;

  const CreateOrderFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
