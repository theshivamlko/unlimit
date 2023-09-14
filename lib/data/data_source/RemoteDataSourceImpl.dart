import 'package:unlimit/data/api/AppApiService.dart';
import 'package:unlimit/data/data_source/RemoteDataSource.dart';

import '../model/JokesResponse.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  AppApiService appApiService;

  RemoteDataSourceImpl(this.appApiService);

  @override
  Future<JokesResponse> getJoke() async {
    try {
      return await appApiService.getJokesAPI();
    } catch (e) {
      print("RemoteDataSourceImpl error $e");
      rethrow;
    }
  }
}
