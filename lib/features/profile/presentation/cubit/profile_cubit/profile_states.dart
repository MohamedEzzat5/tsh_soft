part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  final BaseOneResponse response;

  const ProfileSuccessState({required this.response});

  @override
  List<Object?> get props => [response];
}

class ProfileFailureState extends ProfileState {
  final String errorMessage;

  const ProfileFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
