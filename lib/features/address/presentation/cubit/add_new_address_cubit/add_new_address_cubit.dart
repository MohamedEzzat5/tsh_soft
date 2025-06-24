import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/address_params.dart';
import 'package:tsh_soft/features/address/domain/usecase/add_address_usecase.dart';

part 'add_new_address_state.dart';

class AddNewAddressCubit extends Cubit<AddNewAddressState> {
  final AddAddressUseCase addLocationsUseCase;

  AddNewAddressCubit({required this.addLocationsUseCase})
      : super(AddLocationInitialState());

  Future<void> addLocation(AddressParams params) async {
    emit(AddLocationLoadingState());
    try {
      final Either<Failure, BaseOneResponse> result =
          await addLocationsUseCase.call(params);
      result.fold(
        (failure) =>
            emit(AddLocationFailureState(errorMessage: failure.message ?? '')),
        (locationData) => emit(AddLocationSuccessState(resp: locationData)),
      );
    } catch (e) {
      emit(AddLocationFailureState(errorMessage: e.toString()));
    }
  }
}
