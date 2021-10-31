import 'package:cats_database/breeds/data/remote/entity/cat_breeds_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'cats_api.g.dart';

@RestApi(baseUrl: "https://api.thecatapi.com/v1/")
abstract class CatApi {
  factory CatApi(Dio dio, {String baseUrl}) = _CatApi;

  @GET("/breeds")
  Future<List<CatBreedsResponse>> getCatBreeds();
}