import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:unlimit/data/api/ErrorHandler.dart';
import 'package:unlimit/domain/model/JokeModel.dart';
import 'package:unlimit/domain/usecases/ShowHistoryJokeCases.dart';

part 'history_state.dart';

/// Cubit for HistoryCubit, managing state of HistoryState
class HistoryCubit extends Cubit<HistoryState> {

  /// use case for fetching Joke from Local DB
  late ShowHistoryJokeCases showHistoryJokeCases;

  HistoryCubit(this.showHistoryJokeCases) : super(HistoryInitial()) {
    print("HistoryCubit1");
    getList();
  }

  /// Get List from Local DB
  void getList() {
    emit(HistoryLoading());
    showHistoryJokeCases.execute().fold((left) {
      emit(HistoryError(ErrorHandler.handle(left.message).errorModel.message));
    }, (right) {
      print("HistoryCubit list ${right}");
      emit(HistoryData(right));
    });
  }
}
