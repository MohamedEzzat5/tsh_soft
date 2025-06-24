part of 'delete_cart_item_cubit.dart';

sealed class DeleteCartItemState extends Equatable {
  const DeleteCartItemState();

  @override
  List<Object?> get props => [];
}

class DeleteCartItemInitialState extends DeleteCartItemState {}

class DeleteCartItemLoadingState extends DeleteCartItemState {}

class DeleteCartItemSuccessState extends DeleteCartItemState {
  final BaseOneResponse resp;

  const DeleteCartItemSuccessState({required this.resp});

  @override
  List<Object?> get props => [resp];
}

class DeleteCartItemFailureState extends DeleteCartItemState {
  final String errorMessage;

  const DeleteCartItemFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
