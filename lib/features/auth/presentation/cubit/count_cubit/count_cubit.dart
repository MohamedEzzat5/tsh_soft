import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'count_state.dart';

class CountdownCubit extends Cubit<CountdownState> {
  static const int initialTime = 60;
  Timer? _timer;

  CountdownCubit()
      : super(CountdownState(timeLeft: initialTime, isCounting: true)) {
    startTimer();
  }

  void startTimer() {
    emit(state.copyWith(isCounting: true));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft > 0) {
        emit(state.copyWith(timeLeft: state.timeLeft - 1));
      } else {
        timer.cancel();
        emit(state.copyWith(isCounting: false));
      }
    });
  }

  void resendCode() {
    if (!state.isCounting) {
      emit(CountdownState(timeLeft: initialTime, isCounting: true));
      startTimer();
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
