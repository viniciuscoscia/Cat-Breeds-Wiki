import 'package:cats_database/breeds/data/remote/remote_data_source.dart';
import 'package:cats_database/breeds/domain/model/cat.dart';
import 'package:cats_database/breeds/domain/repository/cats_repository.dart';
import 'package:get_it/get_it.dart';

class CatsRepositoryImpl implements CatsRepository {
  final RemoteDataSource _remoteDataSource = GetIt.I();

  @override
  Future<List<Cat>> getCatBreeds() => _remoteDataSource.getCatBreeds();

  @override
  Future<List<String>> getCatImagesByBreedId(String breedId) => _remoteDataSource.getCatImagesByBreedId(breedId);
}