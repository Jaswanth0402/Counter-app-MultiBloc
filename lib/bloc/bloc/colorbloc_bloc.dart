import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:multi_bloc/bloc/bloc/counter_bloc.dart';


part 'colorbloc_state.dart';

class ColorblocBloc extends Bloc<CounterEvent, ColorState> {
  ColorblocBloc() : super(ColorInitial()) {
    on<CounterIncrementEvent>((event, emit) {
       emit(ColorIncrementState((state.color =Colors.greenAccent)));
    });
    on<CounterDecrementEvent>((event, emit) {
       emit(ColorDecrementState((state.color =Colors.redAccent)));
    });
  }
}
