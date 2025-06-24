import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/auth/domain/usecases/delete_account_usecase.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final DeleteAccountUseCase deleteAccountUseCase;
  DeleteAccountCubit({required this.deleteAccountUseCase})
      : super(DeleteAccountInitial());

  Future<void> deleteAccount() async {
    emit(DeleteAccountLoading());
    final result = await deleteAccountUseCase(NoParams());
    result.fold(
        (failure) => emit(DeleteAccountFailure(
            message: failure.message ?? 'Please try again later')),
        (response) => emit(DeleteAccountSuccess(response: response)));
  }
}
