import 'package:bloc/bloc.dart';

class SelectProductFilterCubit extends Cubit<int> {
  SelectProductFilterCubit() : super(-1); 

  void selectAll() => emit(-1);

  void selectItem(int index) => emit(index);
}
