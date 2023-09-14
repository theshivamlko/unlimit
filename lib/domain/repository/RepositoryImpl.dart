import 'package:either_dart/either.dart';
import 'package:unlimit/app/extensions.dart';
import 'package:unlimit/data/localdb/LocalDBRepository.dart';
import 'package:unlimit/data/model/ErrorModel.dart';
import 'package:unlimit/data/model/JokesResponse.dart';
import 'package:unlimit/domain/model/JokeModel.dart';
import 'package:unlimit/domain/mapper/mapper.dart';
import 'package:unlimit/domain/repository/Repository.dart';

import '../../data/api/ErrorHandler.dart';
import '../../data/data_source/RemoteDataSource.dart';

class RepositoryImpl implements Repository {
  RemoteDataSource remoteDataSource;
  LocalDBRepository localDBRepository;

  RepositoryImpl(this.remoteDataSource,this.localDBRepository);

  @override
  Future<Either<ErrorModel, JokeModel>> getJoke() async {
    Either<ErrorModel, JokeModel> either =
        Left(ErrorModel(0, "Something Gone Wrong"));

    try {
      var resposne = await remoteDataSource.getJoke();
      print("RepositoryImpl11 ${resposne}");
      print("RepositoryImpl11 ${resposne?.jokeString}");

      JokeModel jokeModel = resposne.toDomainModel();
      localDBRepository.insert(jokeModel);

      print("RepositoryImpl1 $jokeModel");
      print("RepositoryImpl2 ${jokeModel.joke}");

      either = Right(jokeModel);
    } catch (e) {
      print("RepositoryImpl error $e");
      either = Left(ErrorHandler.handle(e).errorModel);
    }

    return either;
  }

  @override
  void insertJokeInDB() {
    // TODO: implement insertJokeInDB
  }
}
