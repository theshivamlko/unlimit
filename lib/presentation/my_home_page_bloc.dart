import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:unlimit/domain/usecases/FetchJokeCases.dart';

part 'my_home_page_event.dart';

part 'my_home_page_state.dart';

class MyHomePageBloc extends Bloc<MyHomePageEvent, MyHomePageState> {
  late FetchJokeCases fetchJokeCases;

  MyHomePageBloc(this.fetchJokeCases) : super(ResultInitial()) {
    on<MyHomePageEvent>((event, emit) {
      print("MyHomePageBloc $event");
      fetchJokeCases.execute().then((value){
        print("MyHomePageBloc then $value");
      }).catchError((error){
        print("MyHomePageBloc error $error");

      });
    });
  }
}
