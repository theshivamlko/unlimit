import 'package:either_dart/either.dart';
import 'package:unlimit/data/model/ErrorModel.dart';
import 'package:unlimit/data/model/JokesResponse.dart';
import 'package:unlimit/domain/JokeModel.dart';
import 'package:unlimit/domain/repository/Repository.dart';

import '../../data/data_source/RemoteDataSource.dart';

class RepositoryImpl implements Repository {
  RemoteDataSource remoteDataSource;

  RepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<ErrorModel, JokeModel>> getJoke() async {
    Either<ErrorModel, JokeModel> either =
        Left(ErrorModel(0, "Something Gone Wrong"));

    try {
      var resposne = await remoteDataSource.getJoke();
      print("RepositoryImpl $resposne");
    } catch (e) {
      print("RepositoryImpl $e");
    }

    return either;
  }
}
