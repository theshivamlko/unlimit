import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:unlimit/data/api/AppApiService.dart';
import 'package:unlimit/data/api/DioFactory.dart';
import 'package:unlimit/data/data_source/RemoteDataSource.dart';
import 'package:unlimit/data/data_source/RemoteDataSourceImpl.dart';
import 'package:unlimit/domain/repository/Repository.dart';
import 'package:unlimit/domain/repository/RepositoryImpl.dart';
import 'package:unlimit/domain/usecases/FetchJokeCases.dart';

final getIt = GetIt.instance;

Future<void> inject() async {
  // HTTP Client DIO
  getIt.registerLazySingleton<DioFactory>(() => DioFactory());
  Dio dio = await getIt.get<DioFactory>().getDio();

  // API Service
  getIt.registerSingleton<AppApiService>(AppApiService(dio));

  // Remote Data Source
  getIt.registerFactory<RemoteDataSource>(
      () => RemoteDataSourceImpl(getIt.get<AppApiService>()));

  // Repository
  getIt.registerFactory<Repository>(
      () => RepositoryImpl(getIt.get<RemoteDataSource>()));

  // use case
  getIt.registerFactory<FetchJokeCases>(
      () => FetchJokeCases(getIt.get<Repository>()));
}
