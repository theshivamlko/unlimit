import 'package:unlimit/data/api/AppApiService.dart';
import 'package:unlimit/data/data_source/RemoteDataSource.dart';

import '../model/JokesResponse.dart';



class RemoteDataSourceImpl implements RemoteDataSource {
  AppApiService appApiService;

  RemoteDataSourceImpl(this.appApiService);

  @override
  Future<JokesResponse> getJoke() {
    try {
      return appApiService.getJokesAPI();
    } catch (e) {
      print("RemoteDataSourceImpl $e");
      rethrow;
    }
  }
}
