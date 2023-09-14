import 'package:either_dart/src/either.dart';
import 'package:unlimit/data/model/ErrorModel.dart';
import 'package:unlimit/domain/model/JokeModel.dart';

import '../repository/Repository.dart';

abstract class BaseUseClass<In, Out> {
  Either<ErrorModel, Out> execute();
}

class ShowHistoryJokeCases implements BaseUseClass {
  Repository repository;

  ShowHistoryJokeCases(this.repository);

  @override
  Either<ErrorModel, dynamic> execute() {
    print("FetchJokeCases $repository");
    return repository.getAllJokeInDB();
  }
}
