import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/home/domain/usecases/get_slider_usecase.dart';

part 'get_sliders_state.dart';

class GetSlidersCubit extends Cubit<GetSlidersState> {
  final GetSlidersUseCase getSlidersUseCase;

  GetSlidersCubit({required this.getSlidersUseCase})
      : super(GetSlidersInitialState());

  Future<void> getSliders() async {
    emit(GetSlidersLoadingState());
    final Either<Failure, BaseListResponse> result =
        await getSlidersUseCase.call(NoParams());
    result.fold(
      (failure) =>
          emit(GetSlidersFailureState(errorMessage: failure.message ?? '')),
      (response) => emit(GetSlidersSuccessState(resp: response)),
    );
  }
}
