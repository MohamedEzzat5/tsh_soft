import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/home/domain/usecases/get_categories_usecase.dart';



part 'category_states.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoryCubit({required this.getCategoriesUseCase})
      : super(CategoryInitialState());

  Future<void> getCategories() async {
    emit(CategoryLoadingState());

    final Either<Failure, BaseListResponse> result =
        await getCategoriesUseCase.call(NoParams());

    result.fold(
      (failure) => emit(CategoryFailureState(
          errorMessage: failure.message ?? 'Please try again')),
      (response) => emit(CategorySuccessState(response: response)),
    );
  }
}
