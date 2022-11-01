import 'package:floor/floor.dart';
import 'package:flutter_base_core_module_1/data/models/weather_core_model.dart';

@dao
abstract class WeatherCoreModelDao {
  @Query("SELECT * FROM weather_core_model")
  Stream<List<WeatherCoreModel>> getWeathersStream();

  @Query("SELECT * FROM weather_core_model")
  Future<List<WeatherCoreModel>> getWeatherCoreModels();

  @insert
  Future<void> add(WeatherCoreModel weatherCoreModel);

  @delete
  Future<void> remove(WeatherCoreModel weatherCoreModel);
}
