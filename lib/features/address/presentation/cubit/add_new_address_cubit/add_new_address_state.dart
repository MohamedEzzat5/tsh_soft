part of 'add_new_address_cubit.dart';

sealed class AddNewAddressState extends Equatable {
  const AddNewAddressState();

  @override
  List<Object?> get props => [];
}

class AddLocationInitialState extends AddNewAddressState {}

class AddLocationLoadingState extends AddNewAddressState {}

class AddLocationSuccessState extends AddNewAddressState {
  final BaseOneResponse resp;

  const AddLocationSuccessState({required this.resp});
  @override
  List<Object?> get props => [resp];
}

class AddLocationFailureState extends AddNewAddressState {
  final String errorMessage;

  const AddLocationFailureState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
