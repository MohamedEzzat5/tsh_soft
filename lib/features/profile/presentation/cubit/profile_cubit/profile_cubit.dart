import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/features/profile/domain/usecases/get_profile_usecase.dart';

import '/core/base_classes/base_one_response.dart';
import '/core/error/failures.dart';
import '/core/usecases/usecase.dart';

part 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;

  ProfileCubit({required this.getProfileUseCase})
      : super(ProfileInitialState());

  Future<void> getProfile() async {
    emit(ProfileLoadingState());

    final Either<Failure, BaseOneResponse> result =
        await getProfileUseCase.call(NoParams());

    result.fold(
      (failure) => emit(ProfileFailureState(
          errorMessage: failure.message ?? 'Please try again')),
      (response) => emit(ProfileSuccessState(response: response)),
    );
  }
}
