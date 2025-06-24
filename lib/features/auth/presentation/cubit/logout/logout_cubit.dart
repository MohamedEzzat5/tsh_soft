import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../domain/usecases/logout_usecase.dart';

part 'logout_states.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUseCase logoutUseCase;
  bool isLoading = false;
  LogoutCubit(this.logoutUseCase) : super(const LogoutInitialState());

  Future<void> fLogout() async {
    changeLoadingView();
    try {
      final Either<Failure, BaseOneResponse> eitherResult =
          await logoutUseCase(NoParams());
      eitherResult.fold((Failure failure) {
        emit(LogoutFailureState(
            errorMessage: failure.message ?? "Please try again later"));
      }, (logOutresponseData) {
        emit(LogoutSuccessState(resp: logOutresponseData));
      });
    } catch (e) {
      emit(
        LogoutFailureState(errorMessage: e.toString()),
      );
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(LogoutLoadingState(isLoading: isLoading));
  }
}
