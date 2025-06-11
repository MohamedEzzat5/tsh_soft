part of 'count_cubit.dart';

class CountdownState extends Equatable {
  final int timeLeft;
  final bool isCounting;

  const CountdownState({required this.timeLeft, required this.isCounting});

  CountdownState copyWith({int? timeLeft, bool? isCounting}) {
    return CountdownState(
      timeLeft: timeLeft ?? this.timeLeft,
      isCounting: isCounting ?? this.isCounting,
    );
  }

  @override
  List<Object> get props => [timeLeft, isCounting];
}
