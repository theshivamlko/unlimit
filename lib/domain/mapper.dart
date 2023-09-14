

import 'package:unlimit/domain/JokeModel.dart';

import '../data/model/JokesResponse.dart';

extension JokesResponseMapper on JokesResponse{

  JokeModel toDomainModel(){
    return JokeModel(this.jokeString);
  }

}