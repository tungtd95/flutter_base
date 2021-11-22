import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_base/data/local/weather_dao.dart';
import 'package:flutter_base/data/models/city.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'weather_database.g.dart';

@Database(version: 1, entities: [City])
abstract class WeatherDatabase extends FloorDatabase {
  WeatherDao get weatherDao;
}
