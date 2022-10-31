import 'package:floor/floor.dart';
import 'package:flutter_base_module_1/data/models/weather_module_1_model.dart';

@dao
abstract class WeatherModule1Dao {

  @Query("SELECT * FROM city")
  Future<List<WeatherModule1Model>> getWeather1s();

  @insert
  Future<void> add(WeatherModule1Model city);

  @delete
  Future<void> remove(WeatherModule1Model city);
}
