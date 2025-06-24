part of 'get_orders_cubit.dart';

sealed class GetOrdersState extends Equatable {
  const GetOrdersState();

  @override
  List<Object?> get props => [];
}

class GetOrdersInitialState extends GetOrdersState {}

class GetOrdersLoadingState extends GetOrdersState {}

class GetOrdersSuccessState extends GetOrdersState {
  final BaseListResponse resp;

  const GetOrdersSuccessState({required this.resp});

  @override
  List<Object?> get props => [resp];
}

class GetOrdersFailureState extends GetOrdersState {
  final String errorMessage;

  const GetOrdersFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
