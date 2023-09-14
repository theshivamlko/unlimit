import 'package:hive_flutter/hive_flutter.dart';
import 'package:unlimit/data/localdb/LocalDBRepository.dart';
import 'package:unlimit/domain/model/JokeModel.dart';

class LocalDBRepositoryImpl implements LocalDBRepository {
  Box hiveBox;

  LocalDBRepositoryImpl(this.hiveBox);

  @override
  List<JokeModel> getAllJokes() {
    return [];
  }

  @override
  void insert(JokeModel joke) {
    try {
      hiveBox.put("key_${DateTime.timestamp().millisecond}", joke);
    } catch (e) {
      print("LocalDBRepositoryImpl error $joke");
    }
  }
}
