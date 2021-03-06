import 'package:cats_database/breeds/domain/model/cat.dart';
import 'package:cats_database/breeds/domain/usecase/get_cat_breeds_use_case.dart';
import 'package:cats_database/breeds/domain/usecase/get_cat_images_by_breed_id_use_case.dart';
import 'package:mobx/mobx.dart';

part 'cat_breeds_view_model.g.dart';

class CatBreedsViewModel = CatBreedsViewModelBase with _$CatBreedsViewModel;

abstract class CatBreedsViewModelBase with Store {
  final GetCatBreedsUseCase _getCatBreedsUseCase = GetCatBreedsUseCase();
  final GetCatImagesByBreedIdUseCase _getCatImagesByBreedIdUseCase = GetCatImagesByBreedIdUseCase();

  @observable
  List<Cat> catList = [];

  @action
  fetchCatBreeds() async {
    catList = await _getCatBreedsUseCase();
    for (var cat in catList) {
      fetchCatImagesById(cat);
    }
  }

  @action
  fetchCatImagesById(Cat cat) async {
    var images = (await _getCatImagesByBreedIdUseCase(cat.id)).toSet().toList();
    for (var image in images) {
      if (!cat.imageUrls.contains(image)) {
        cat.imageUrls.add(image);
      }
    }
    catList = catList;
  }
}