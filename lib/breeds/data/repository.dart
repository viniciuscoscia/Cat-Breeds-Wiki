import 'package:cats_database/breeds/data/remote/remote_data_source.dart';
import 'package:cats_database/breeds/domain/model/cat.dart';
import 'package:cats_database/breeds/domain/repository/cats_repository.dart';
import 'package:get_it/get_it.dart';

class CatsRepositoryImpl implements CatsRepository {
  final RemoteDataSource _remoteDataSource = GetIt.I();

  @override
  Future<List<Cat>> fetchCatBreeds() => _remoteDataSource.fetchCatBreeds();
}