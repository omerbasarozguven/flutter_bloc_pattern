part of 'counter_cubit.dart';

class CounterState {
  int counterValue;
  bool? wasIncremented;
  String? str;

  CounterState({
    required this.counterValue,
    this.wasIncremented,
    this.str,
  });
}
