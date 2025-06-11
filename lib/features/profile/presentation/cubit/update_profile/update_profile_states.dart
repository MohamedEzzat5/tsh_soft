part of 'update_profile_cubit.dart';

abstract class UpdateProfileState extends Equatable {
  const UpdateProfileState();

  @override
  List<Object?> get props => [];
}

class UpdateProfileInitialState extends UpdateProfileState {}

class UpdateProfileLoadingState extends UpdateProfileState {}

class UpdateProfileSuccessState extends UpdateProfileState {
  final BaseOneResponse response;

  const UpdateProfileSuccessState({required this.response});

  @override
  List<Object?> get props => [response];
}

class UpdateProfileFailureState extends UpdateProfileState {
  final String errorMessage;

  const UpdateProfileFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
