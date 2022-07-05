import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(CounterState(
      counterValue: state.counterValue + 1,
      wasIncremented: true,
      str: state.str));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1,
      wasIncremented: false,
      str: state.str));

  void takeString(String user_input) => emit(CounterState(
      counterValue: state.counterValue, wasIncremented: null, str: user_input));
}
