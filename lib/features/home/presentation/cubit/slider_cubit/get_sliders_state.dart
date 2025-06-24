part of 'get_sliders_cubit.dart';

sealed class GetSlidersState extends Equatable {
  const GetSlidersState();

  @override
  List<Object?> get props => [];
}

class GetSlidersInitialState extends GetSlidersState {}

class GetSlidersLoadingState extends GetSlidersState {}

class GetSlidersSuccessState extends GetSlidersState {
  final BaseListResponse resp;

  const GetSlidersSuccessState({required this.resp});
  @override
  List<Object?> get props => [resp];
}

class GetSlidersFailureState extends GetSlidersState {
  final String errorMessage;

  const GetSlidersFailureState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
