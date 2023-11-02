part of 'counter_bloc.dart';

abstract class CounterState {
    int counter=0;
    CounterState({required this.counter});
}
      
final class CounterInitial extends CounterState {
   CounterInitial():super(counter: 0);
}


class CounterIncrementState extends CounterState{
     CounterIncrementState(int incrementcounter):super(counter: incrementcounter);
}

class CounterDecrementState extends CounterState{
   CounterDecrementState(int decrementcounter):super(counter: decrementcounter);
}
