part of 'history_cubit.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryData extends HistoryState {
  List<JokeModel> jokesList;

  HistoryData(this.jokesList);
}

class HistoryError extends HistoryState {
  String message;

  HistoryError(this.message);
}
