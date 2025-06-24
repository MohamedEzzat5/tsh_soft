part of 'get_page_cubit.dart';

sealed class GetPageState extends Equatable {
  const GetPageState();

  @override
  List<Object?> get props => [];
}

class GetPageInitialState extends GetPageState {}

class GetPageLoadingState extends GetPageState {}

class GetPageSuccessState extends GetPageState {
  final BaseOneResponse resp;

  const GetPageSuccessState({required this.resp});

  @override
  List<Object?> get props => [resp];
}

class GetPageFailureState extends GetPageState {
  final String errorMessage;

  const GetPageFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}