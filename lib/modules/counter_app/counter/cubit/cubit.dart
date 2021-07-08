import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'States.dart';

class counter_cubit extends Cubit<counter_states>
{
  counter_cubit(): super (counter_initial_state()) ;
  static counter_cubit get (context)=>BlocProvider.of(context) ;
  int counter = 1 ;
  void minus()
  {
    counter-- ;
    emit(counter_minus_state()) ;
  }
  void plus()
  {
    counter++ ;
    emit(counter_plus_state()) ;
  }
}