import 'package:cats_database/breeds/di_setting.dart';
import 'package:cats_database/cat_app.dart';
import 'package:flutter/material.dart';

void main() {
  registerDiInstances();

  runApp(const CatApp());
}
