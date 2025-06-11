part of 'get_products_cubit.dart';

sealed class GetProductsState extends Equatable {
  const GetProductsState();

  @override
  List<Object> get props => [];
}

final class GetProductsInitial extends GetProductsState {}
final class GetProductsLoading extends GetProductsState {}

final class GetProductsSuccess extends GetProductsState {
  final BaseListResponse response;
  const GetProductsSuccess({required this.response});
}

final class GetProductsError extends GetProductsState {
  final String message;
  const GetProductsError({required this.message});
}
