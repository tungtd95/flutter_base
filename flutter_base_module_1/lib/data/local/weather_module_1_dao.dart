import 'package:floor/floor.dart';
import 'package:flutter_base_module_1/data/models/weather_module_1_model.dart';

@dao
abstract class WeatherModule1Dao {
  @Query("SELECT * FROM weather_module_1_model")
  Stream<List<WeatherModule1Model>> getWeathersStream();

  @Query("SELECT * FROM weather_module_1_model")
  Future<List<WeatherModule1Model>> getWeather1s();

  @insert
  Future<void> add(WeatherModule1Model weatherModule1Model);

  @delete
  Future<void> remove(WeatherModule1Model weatherModule1Model);
}
