import 'package:cats_database/breeds/domain/model/cat.dart';
import 'package:cats_database/breeds/domain/usecase/get_cat_breeds.dart';
import 'package:mobx/mobx.dart';

part 'cat_breeds_view_model.g.dart';

class CatBreedsViewModel = CatBreedsViewModelBase with _$CatBreedsViewModel;

abstract class CatBreedsViewModelBase with Store {
  final GetCatBreedsUseCase _getCatBreedsUseCase = GetCatBreedsUseCase();

  @observable
  List<Cat> catList = [];

  @action
  fetchCatBreeds() async {
    catList = await _getCatBreedsUseCase.getCatBreeds();
  }
}