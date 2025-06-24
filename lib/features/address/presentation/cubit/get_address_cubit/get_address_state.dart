part of 'get_address_cubit.dart';

sealed class GetAddressesState extends Equatable {
  const GetAddressesState();

  @override
  List<Object?> get props => [];
}

class GetAddressesInitialState extends GetAddressesState {}

class GetAddressesLoadingState extends GetAddressesState {}

class GetAddressesSuccessState extends GetAddressesState {
  final BaseListResponse resp;

  const GetAddressesSuccessState({required this.resp});
  @override
  List<Object?> get props => [resp];
}

class GetAddressesFailureState extends GetAddressesState {
  final String errorMessage;

  const GetAddressesFailureState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
