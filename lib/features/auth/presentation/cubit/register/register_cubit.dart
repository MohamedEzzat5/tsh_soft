import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/params/auth_params.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/register_usecase.dart';

part 'register_states.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterCubit(this.registerUseCase) : super(const RegisterInitialState());

  Future<void> fRegister({required AuthParams params}) async {
    try {
      emit(RegisterLoadingState());

      final Either<Failure, BaseOneResponse> eitherResult =
          await registerUseCase.call(params);
      eitherResult.fold((Failure failure) {
        emit(RegisterFailureState(
            errorMessage: failure.message ?? "Please try again later"));
      }, (response) {
        emit(RegisterSuccessState(response: response));
      });
    } catch (e) {
      emit(RegisterFailureState(errorMessage: e.toString()));
    }
  }
}
