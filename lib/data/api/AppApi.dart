import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:unlimit/data/ApiConstants.dart';
import 'package:unlimit/data/model/JokesResponse.dart';
part 'AppApi.g.dart';


@RestApi(baseUrl: ApiConstants.baseURL)
abstract class AppApiService {
  factory AppApiService(Dio dio, {String baseURL}) = _AppApiService;

  @GET("/")
  Future<JokesResponse> getJokesAPI();
}
