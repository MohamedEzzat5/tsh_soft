part of 'get_product_details_cubit.dart';

sealed class GetProductDetailsState extends Equatable {
  const GetProductDetailsState();

  @override
  List<Object> get props => [];
}

final class GetProductDetailsInitial extends GetProductDetailsState {}
final class GetProductDetailsLoading extends GetProductDetailsState {}

final class GetProductDetailsSuccess extends GetProductDetailsState {
  final BaseOneResponse response;
  const GetProductDetailsSuccess({required this.response});
}

final class GetProductDetailsError extends GetProductDetailsState {
  final String message;
  const GetProductDetailsError({required this.message});
}

