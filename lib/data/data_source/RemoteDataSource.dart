

import 'package:unlimit/data/model/JokesResponse.dart';

abstract class RemoteDataSource {
  Future<JokesResponse> getJoke();
}