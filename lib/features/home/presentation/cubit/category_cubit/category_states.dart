part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategorySuccessState extends CategoryState {
  final BaseListResponse response;

  const CategorySuccessState({required this.response});

  @override
  List<Object?> get props => [response];
}

class CategoryFailureState extends CategoryState {
  final String errorMessage;

  const CategoryFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
