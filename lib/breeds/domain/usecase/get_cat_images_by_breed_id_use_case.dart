import 'package:cats_database/breeds/domain/repository/cats_repository.dart';
import 'package:get_it/get_it.dart';

class GetCatImagesByBreedIdUseCase {
  final CatsRepository repository = GetIt.I();

  Future<List<String>> call(String breedId) {
    return repository.getCatImagesByBreedId(breedId);
  }
}
