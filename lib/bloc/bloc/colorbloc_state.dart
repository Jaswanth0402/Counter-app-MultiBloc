part of 'colorbloc_bloc.dart';


sealed class ColorState {
   Color color =Colors.yellow;
    ColorState({required this.color});
}

final class ColorInitial extends ColorState {
   ColorInitial( ):super(color: Colors.yellow);
  
}
class ColorIncrementState extends ColorState{
     ColorIncrementState(Color incrementcolor):super(color: incrementcolor);
}

class ColorDecrementState extends ColorState{
   ColorDecrementState(Color decrementcolor):super(color: decrementcolor);
}

