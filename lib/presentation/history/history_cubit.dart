import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:unlimit/data/api/ErrorHandler.dart';
import 'package:unlimit/domain/model/JokeModel.dart';
import 'package:unlimit/domain/usecases/ShowHistoryJokeCases.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  late ShowHistoryJokeCases showHistoryJokeCases;

  HistoryCubit(this.showHistoryJokeCases) : super(HistoryInitial()) {
    print("HistoryCubit1");
    getList();
  }

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
