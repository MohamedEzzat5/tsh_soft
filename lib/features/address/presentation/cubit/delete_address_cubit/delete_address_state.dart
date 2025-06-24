part of 'delete_address_cubit.dart';

sealed class DeleteAddressState extends Equatable {
  const DeleteAddressState();

  @override
  List<Object?> get props => [];
}

class DeleteLocationInitialState extends DeleteAddressState {}

class DeleteLocationLoadingState extends DeleteAddressState {}

class DeleteLocationSuccessState extends DeleteAddressState {
  final BaseOneResponse resp;

  const DeleteLocationSuccessState({required this.resp});
  @override
  List<Object?> get props => [resp];
}

class DeleteLocationFailureState extends DeleteAddressState {
  final String errorMessage;

  const DeleteLocationFailureState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
