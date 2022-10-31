import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_base_core_module_1/data/local/weather_core_model_dao.dart';
import 'package:flutter_base_core_module_1/data/models/weather_core_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'weather_core_database.g.dart';

@Database(version: 1, entities: [WeatherCoreModel])
abstract class WeatherCoreDatabase extends FloorDatabase {
  WeatherCoreModelDao get weatherCoreModelDao;
}
