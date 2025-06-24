import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/address_params.dart';
import 'package:tsh_soft/features/address/domain/usecase/delete_address_use_case.dart';

part 'delete_address_state.dart';

class DeleteAddressCubit extends Cubit<DeleteAddressState> {
  final DeleteAddressUseCase deleteLocationUseCase;

  DeleteAddressCubit({required this.deleteLocationUseCase})
      : super(DeleteLocationInitialState());

  Future<void> deleteLocation(AddressParams params) async {
    emit(DeleteLocationLoadingState());
    try {
      final Either<Failure, BaseOneResponse> result =
          await deleteLocationUseCase.call(params);
      result.fold(
        (failure) => emit(
            DeleteLocationFailureState(errorMessage: failure.message ?? '')),
        (locationData) => emit(DeleteLocationSuccessState(resp: locationData)),
      );
    } catch (e) {
      emit(DeleteLocationFailureState(errorMessage: e.toString()));
    }
  }
}
