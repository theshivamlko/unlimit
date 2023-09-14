
import 'package:flutter/material.dart';
import 'package:unlimit/domain/model/JokeModel.dart';

@immutable
abstract class MyHomePageState {}

class ResultInitial extends MyHomePageState {}

class ResultLoading extends MyHomePageState {}

class ResultData extends MyHomePageState {
  JokeModel jokeModel;

  ResultData(this.jokeModel);
}

class ResultError extends MyHomePageState {
  String message;


  ResultError( this.message);
}
