import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_home_page_event.dart';
part 'my_home_page_state.dart';

class MyHomePageBloc extends Bloc<MyHomePageEvent, MyHomePageState> {
  MyHomePageBloc() : super(ResultInitial()) {
    on<MyHomePageEvent>((event, emit) {

    });


  }


  Future<MyHomePageState?> getJokes()async{

    return null;
  }
}
