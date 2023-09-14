import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:unlimit/data/api/ErrorHandler.dart';
import 'package:unlimit/domain/model/JokeModel.dart';
import 'package:unlimit/domain/usecases/FetchJokeCases.dart';

import 'my_home_page_state.dart';


/// Cubit for Home Page, managing state of MyHomePageState
class MyHomePageBloc extends Cubit<MyHomePageState> {

  /// use case for fetching Joke from API
  late FetchJokeCases fetchJokeCases;

  MyHomePageBloc(this.fetchJokeCases) : super(ResultInitial()) {
     refresh();
  }

  /// Fetch New Joke
  Future<void> refresh() async {
     emit(ResultLoading());
    fetchJokeCases.execute().fold((left)  {
      emit(ResultError(ErrorHandler.handle(left.message).errorModel.message));
    }, (right) {
      emit(ResultData(right));
    });
  }
}
