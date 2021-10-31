import 'package:cats_database/breeds/data/remote/api/cats_api.dart';
import 'package:cats_database/breeds/data/remote/entity/cat_breeds_response.dart';
import 'package:cats_database/breeds/domain/model/cat.dart';
import 'package:cats_database/breeds/data/remote/entity/mapper/cat_breed_response_mapper.dart';

import 'package:get_it/get_it.dart';

class CatsRemoteDataSourceImpl implements RemoteDataSource {
  late final CatApi _api = GetIt.I();

  @override
  Future<List<Cat>> fetchCatBreeds() async {
    List<CatBreedsResponse> response = await _api.getCatBreeds();

    return Future<List<Cat>>.value(response.toDomainEntity());
  }
}

abstract class RemoteDataSource {
  Future<List<Cat>> fetchCatBreeds();
}
