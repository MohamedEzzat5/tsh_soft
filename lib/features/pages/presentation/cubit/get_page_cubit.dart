import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/page_params.dart';
import 'package:tsh_soft/features/pages/domain/usecases/get_page_usecase.dart';

part 'get_page_state.dart';

class GetPageCubit extends Cubit<GetPageState> {
  final GetPageUseCase getPageUseCase;

  GetPageCubit({required this.getPageUseCase}) : super(GetPageInitialState());

  Future<void> getPage({required PageParams params}) async {
    emit(GetPageLoadingState());
    final Either<Failure, BaseOneResponse> result =
        await getPageUseCase.call(params);
    result.fold(
      (failure) =>
          emit(GetPageFailureState(errorMessage: failure.message ?? '')),
      (response) => emit(GetPageSuccessState(resp: response)),
    );
  }
}
