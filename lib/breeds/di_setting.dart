import 'package:cats_database/breeds/data/di/data_module.dart';
import 'presenter/di/presenter_module.dart';

void registerDiInstances() {
  registerDataInstances();
  registerPresenterInstances();
}