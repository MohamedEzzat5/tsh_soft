part of 'get_cart_cubit.dart';

sealed class GetCartState extends Equatable {
  const GetCartState();

  @override
  List<Object?> get props => [];
}

class GetCartInitialState extends GetCartState {}

class GetCartLoadingState extends GetCartState {}

class GetCartSuccessState extends GetCartState {
  final BaseOneResponse resp;

  const GetCartSuccessState({required this.resp});

  @override
  List<Object?> get props => [resp];
}

class GetCartFailureState extends GetCartState {
  final String errorMessage;

  const GetCartFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
