part of 'update_cart_item_cubit.dart';

sealed class UpdateCartItemState extends Equatable {
  const UpdateCartItemState();

  @override
  List<Object?> get props => [];
}

class UpdateCartItemInitialState extends UpdateCartItemState {}

class UpdateCartItemLoadingState extends UpdateCartItemState {}

class UpdateCartItemSuccessState extends UpdateCartItemState {
  final BaseOneResponse resp;

  const UpdateCartItemSuccessState({required this.resp});

  @override
  List<Object?> get props => [resp];
}

class UpdateCartItemFailureState extends UpdateCartItemState {
  final String errorMessage;

  const UpdateCartItemFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
