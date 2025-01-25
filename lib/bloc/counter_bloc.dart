import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrement);
  }

  _increment(IncrementEvent event, Emitter<CounterState> emit) {
    var state = this.state;
    emit(CounterState(state.counter + 1));
  }

  _decrement(DecrementEvent event, Emitter<CounterState> emit) {
    var state = this.state;
    emit(CounterState(state.counter - 1));
  }
}
