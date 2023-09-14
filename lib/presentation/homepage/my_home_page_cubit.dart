import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:unlimit/data/api/ErrorHandler.dart';
import 'package:unlimit/domain/model/JokeModel.dart';
import 'package:unlimit/domain/usecases/FetchJokeCases.dart';

import 'my_home_page_state.dart';
import 'my_home_page_state.dart';



class MyHomePageBloc extends Cubit<MyHomePageState> {
  late FetchJokeCases fetchJokeCases;

  MyHomePageBloc(this.fetchJokeCases) : super(ResultInitial()) {
    print("MyHomePageBloc super ");
    refresh();
  }

  Future<void> refresh() async {
    print("MyHomePageBloc refresh ");
    emit(ResultLoading());
    fetchJokeCases.execute().fold((left)  {

      emit(ResultError(ErrorHandler.handle(left.message).errorModel.message));
    }, (right) {
      emit(ResultData(right));
    });
  }
}
