 import 'package:hive_flutter/hive_flutter.dart';
import 'package:unlimit/domain/model/JokeModel.dart';

class HiveDBFactory {
  Future<Box<JokeModel>> getBox() async {
    Hive.registerAdapter(JokeModelAdapter());
    Box<JokeModel> hiveBox = await Hive.openBox<JokeModel>("jokes");
    return hiveBox;
  }
}
