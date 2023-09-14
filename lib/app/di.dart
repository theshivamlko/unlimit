import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:unlimit/data/api/AppApiService.dart';
import 'package:unlimit/data/api/DioFactory.dart';
import 'package:unlimit/data/data_source/RemoteDataSource.dart';
import 'package:unlimit/data/data_source/RemoteDataSourceImpl.dart';
import 'package:unlimit/data/localdb/HiveDBFactory.dart';
import 'package:unlimit/data/localdb/LocalDBRepository.dart';
import 'package:unlimit/data/localdb/LocalDBRepositoryImpl.dart';
import 'package:unlimit/domain/model/JokeModel.dart';
import 'package:unlimit/domain/repository/Repository.dart';
import 'package:unlimit/domain/repository/RepositoryImpl.dart';
import 'package:unlimit/domain/usecases/FetchJokeCases.dart';
import 'package:unlimit/domain/usecases/ShowHistoryJokeCases.dart';

final getIt = GetIt.instance;

Future<void> inject() async {
  // Local DB
  getIt.registerLazySingleton<HiveDBFactory>(() => HiveDBFactory());
  Box<JokeModel> box = await getIt.get<HiveDBFactory>().getBox();

  // HTTP Client DIO
  getIt.registerLazySingleton<DioFactory>(() => DioFactory());
  Dio dio = await getIt.get<DioFactory>().getDio();

  // API Service
  getIt.registerLazySingleton<AppApiService>(() => AppApiService(dio));

  // Remote Data Source
  getIt.registerFactory<RemoteDataSource>(
      () => RemoteDataSourceImpl(getIt.get<AppApiService>()));

  // Remote Data Source
  getIt.registerLazySingleton<LocalDBRepository>(
      () => LocalDBRepositoryImpl(box));

  // Repository
  getIt.registerFactory<Repository>(() => RepositoryImpl(
      getIt.get<RemoteDataSource>(), getIt.get<LocalDBRepository>()));

  // Fetch Single Joke use case
  getIt.registerFactory<FetchJokeCases>(
      () => FetchJokeCases(getIt.get<Repository>()));


  // Fetch All Joke use case
  getIt.registerFactory<ShowHistoryJokeCases>(
      () => ShowHistoryJokeCases(getIt.get<Repository>()));
}
