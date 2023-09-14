import 'package:either_dart/src/either.dart';
import 'package:unlimit/data/model/ErrorModel.dart';
import 'package:unlimit/domain/usecases/BaseUseCase.dart';

import '../repository/Repository.dart';

class FetchJokeCases implements BaseUseClass {
  Repository repository;

  FetchJokeCases(this.repository);

  @override
  Future<Either<ErrorModel, dynamic>> execute() {
    return repository.getJoke();
  }
}
