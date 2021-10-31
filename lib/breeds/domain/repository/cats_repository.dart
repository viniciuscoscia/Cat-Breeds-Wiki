import 'package:cats_database/breeds/domain/model/cat.dart';

abstract class CatsRepository {
  Future<List<Cat>> fetchCatBreeds();
}