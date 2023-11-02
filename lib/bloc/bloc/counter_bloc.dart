import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
   
    on<CounterIncrementEvent>((event, emit) {
       emit(CounterIncrementState((state.counter+1)));
    });
    on<CounterDecrementEvent>((event, emit) {
       emit(CounterDecrementState((state.counter-1)));
    });
  }

}

  
