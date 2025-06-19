import 'package:bloc_test/bloc/counter_bloc/Counter_event.dart';
import 'package:bloc_test/bloc/counter_bloc/Counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() : super(const CounterState()){
    on<IncrementCounterEvent>((event, emit) {
      emit(state.copywith(count: state.count + 1));
    });

    on<DecrementCounterEvent>((event, emit) {
      emit(state.copywith(count: state.count - 1));
    });
  }
}