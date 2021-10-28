import 'package:cats_database/cat_app.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:cats_database/breeds/data/remote/api/cats_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CatApp());

  final dio = Dio();   // Provide a dio instance
  // dio.options.headers["Demo-Header"] = "demo header";   // config your dio headers globally
  final client = CatsApi(dio);

  client.getCatBreeds().then((value) => value.forEach((element) => debugPrint(element.name)));
}
