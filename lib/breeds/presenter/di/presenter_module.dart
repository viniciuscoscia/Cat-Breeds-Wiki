import 'package:cats_database/breeds/presenter/main/cat_breeds_view_model.dart';
import 'package:get_it/get_it.dart';

final _getIt = GetIt.instance;

void registerPresenterInstances() {
  _getIt.registerSingleton<CatBreedsViewModel>(CatBreedsViewModel());
}