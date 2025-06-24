part of 'delete_account_cubit.dart';

sealed class DeleteAccountState extends Equatable {
  const DeleteAccountState();

  @override
  List<Object> get props => [];
}

final class DeleteAccountInitial extends DeleteAccountState {}

final class DeleteAccountLoading extends DeleteAccountState {}

final class DeleteAccountSuccess extends DeleteAccountState {
  final BaseOneResponse response;
  const DeleteAccountSuccess({required this.response});
}

final class DeleteAccountFailure extends DeleteAccountState {
  final String message;
  const DeleteAccountFailure({required this.message});
}
