import 'package:cats_database/breeds/data/remote/remote_data_source.dart';
import 'package:cats_database/breeds/domain/repository/cats_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:cats_database/breeds/data/remote/api/cats_api.dart';

import '../repository.dart';

final _getIt = GetIt.instance;
final _dio = Dio();

void registerDataInstances() {
  _dio.interceptors.add(LogInterceptor(responseBody: true));

  _getIt.registerSingleton<CatApi>(CatApi(_dio));
  _getIt.registerSingleton<RemoteDataSource>(CatsRemoteDataSourceImpl());
  _getIt.registerSingleton<CatsRepository>(CatsRepositoryImpl());
}