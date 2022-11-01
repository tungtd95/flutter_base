import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_base_module_1/data/local/weather_module_1_dao.dart';
import 'package:flutter_base_module_1/data/models/weather_module_1_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'weather_module_1_database.g.dart';

@Database(version: 1, entities: [WeatherModule1Model])
abstract class WeatherModule1Database extends FloorDatabase {
  WeatherModule1Dao get weatherModule1Dao;
}
