

import 'package:either_dart/either.dart';
import 'package:unlimit/data/model/ErrorModel.dart';

abstract class BaseUseClass<In,Out>{

  Future<Either<ErrorModel,Out>> execute();

}