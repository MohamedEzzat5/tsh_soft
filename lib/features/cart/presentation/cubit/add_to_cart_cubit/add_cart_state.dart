part of 'add_cart_cubit.dart';

sealed class AddToCartState extends Equatable {
  const AddToCartState();

  @override
  List<Object?> get props => [];
}

class AddToCartInitialState extends AddToCartState {}

class AddToCartLoadingState extends AddToCartState {}

class AddToCartSuccessState extends AddToCartState {
  final BaseOneResponse resp;

  const AddToCartSuccessState({required this.resp});

  @override
  List<Object?> get props => [resp];
}

class AddToCartFailureState extends AddToCartState {
  final String errorMessage;

  const AddToCartFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
