import 'package:either_dart/src/either.dart';
import 'package:unlimit/data/model/ErrorModel.dart';
import 'package:unlimit/domain/model/JokeModel.dart';
import 'package:unlimit/domain/usecases/BaseUseCase.dart';

import '../repository/Repository.dart';

class FetchJokeCases implements BaseUseClass {
  Repository repository;

  FetchJokeCases(this.repository);

  @override
  Future<Either<ErrorModel, JokeModel>> execute() async{
    print("FetchJokeCases $repository");
    return await repository.getJoke();
  }
}
