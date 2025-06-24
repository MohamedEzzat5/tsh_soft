import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/address/domain/usecase/get_addresses_usecase.dart';

part 'get_address_state.dart';

class GetAddressesCubit extends Cubit<GetAddressesState> {
  final GetAddressesUseCase getAddedLocationsUseCase;

  GetAddressesCubit({required this.getAddedLocationsUseCase})
      : super(GetAddressesInitialState());

  Future<void> getAddresses() async {
    emit(GetAddressesLoadingState());
    try {
      final Either<Failure, BaseListResponse> result =
          await getAddedLocationsUseCase.call(NoParams());
      result.fold(
        (failure) =>
            emit(GetAddressesFailureState(errorMessage: failure.message ?? '')),
        (respose) => emit(GetAddressesSuccessState(resp: respose)),
      );
    } catch (e) {
      emit(GetAddressesFailureState(errorMessage: e.toString()));
    }
  }
}
