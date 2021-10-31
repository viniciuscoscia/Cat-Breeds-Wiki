import 'package:cats_database/breeds/domain/model/cat.dart';
import 'package:cats_database/breeds/domain/usecase/get_cat_breeds.dart';
import 'package:flutter/material.dart';

class CatBreedsViewModel with ChangeNotifier {
  final GetCatBreedsUseCase _getCatBreedsUseCase = GetCatBreedsUseCase();
  List<Cat> catList = [];

  void fetchCatBreeds() async {
    catList = await _getCatBreedsUseCase.getCatBreeds();
    notifyListeners();
  }
}