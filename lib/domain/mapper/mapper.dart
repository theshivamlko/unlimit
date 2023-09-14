

import 'package:unlimit/domain/model/JokeModel.dart';

import '../../data/model/JokesResponse.dart';

extension JokesResponseMapper on JokesResponse{

  JokeModel toDomainModel(){
    return JokeModel(this.jokeString);
  }

}