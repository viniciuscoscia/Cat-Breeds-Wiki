import 'package:cats_database/breeds/domain/model/cat.dart';

abstract class CatsRepository {
  Future<List<Cat>> getCatBreeds();
  Future<List<String>> getCatImagesByBreedId(String breedId);
}