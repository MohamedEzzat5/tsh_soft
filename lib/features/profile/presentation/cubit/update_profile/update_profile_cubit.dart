import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/core/params/update_profile_params.dart';
import 'package:tsh_soft/features/profile/domain/usecases/update_profile_usecase.dart';

import '/core/base_classes/base_one_response.dart';
import '/core/error/failures.dart';

part 'update_profile_states.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateProfileUseCase updateProfileUseCase;

  UpdateProfileCubit({required this.updateProfileUseCase})
      : super(UpdateProfileInitialState());

  Future<void> updateProfile({required UpdateProfileParams params}) async {
    emit(UpdateProfileLoadingState());

    final Either<Failure, BaseOneResponse> result =
        await updateProfileUseCase.call(params);

    result.fold(
      (failure) => emit(UpdateProfileFailureState(
          errorMessage: failure.message ?? 'Please try again')),
      (response) => emit(UpdateProfileSuccessState(response: response)),
    );
  }
}
