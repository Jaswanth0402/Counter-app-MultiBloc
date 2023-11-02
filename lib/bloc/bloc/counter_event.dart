part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterIntialEvent extends CounterEvent{}

class CounterIncrementEvent extends CounterEvent{
      
}
class CounterDecrementEvent extends CounterEvent{
  
}