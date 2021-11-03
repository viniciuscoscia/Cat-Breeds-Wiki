import 'package:cats_database/breeds/data/remote/api/cats_api.dart';
import 'package:cats_database/breeds/domain/model/cat.dart';
import 'package:cats_database/breeds/data/remote/entity/mapper/cat_breed_response_mapper.dart';

import 'package:get_it/get_it.dart';

class CatsRemoteDataSourceImpl implements RemoteDataSource {
  late final CatApi _api = GetIt.I();

  @override
  Future<List<Cat>> getCatBreeds() async {
    var response = await _api.getCatBreeds();

    return Future.value(response.toDomainEntity());
  }

  @override
  Future<List<String>> getCatImagesByBreedId(String breedId) async {
    var response = await _api.getImagesByBreedId(breedId);

    return Future.value(response.where((element) => element.url != null)
        .map((breed) => breed.url!)
        .toList());
  }
}

abstract class RemoteDataSource {
  Future<List<Cat>> getCatBreeds();
  Future<List<String>> getCatImagesByBreedId(String breedId);
}
