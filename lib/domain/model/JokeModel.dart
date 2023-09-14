

import 'package:hive/hive.dart';

part 'JokeModel.g.dart';

@HiveType(typeId: 1)
class JokeModel{


  @HiveField(0)
  String joke;

  JokeModel(this.joke);
}