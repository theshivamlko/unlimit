import 'package:either_dart/either.dart';
import 'package:unlimit/data/model/ErrorModel.dart';
import 'package:unlimit/data/model/JokesResponse.dart';
import 'package:unlimit/domain/model/JokeModel.dart';

abstract class Repository {
  Future<Either<ErrorModel, JokeModel>>  getJoke();
}
