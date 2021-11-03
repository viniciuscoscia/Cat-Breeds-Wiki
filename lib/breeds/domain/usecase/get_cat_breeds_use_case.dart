import 'package:cats_database/breeds/domain/model/cat.dart';
import 'package:cats_database/breeds/domain/repository/cats_repository.dart';
import 'package:get_it/get_it.dart';

class GetCatBreedsUseCase {
  final CatsRepository repository = GetIt.I();

  Future<List<Cat>> call() {
    return repository.getCatBreeds();
  }
}