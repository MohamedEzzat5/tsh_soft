import 'package:bloc/bloc.dart';

class TabCubit extends Cubit<int> {
  TabCubit() : super(0);

  void selectTab(int index) => emit(index);
}
