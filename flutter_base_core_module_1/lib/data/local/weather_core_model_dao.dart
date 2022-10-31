import 'package:floor/floor.dart';
import 'package:flutter_base_core_module_1/data/models/weather_core_model.dart';

@dao
abstract class WeatherCoreModelDao {

  @Query("SELECT * FROM city")
  Future<List<WeatherCoreModel>> getWeatherCoreModels();

  @insert
  Future<void> add(WeatherCoreModel city);

  @delete
  Future<void> remove(WeatherCoreModel city);
}
