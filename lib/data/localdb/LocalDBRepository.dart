

import 'package:unlimit/domain/model/JokeModel.dart';

abstract class LocalDBRepository{

  void insert(JokeModel joke);
  List<JokeModel> getAllJokes();

}