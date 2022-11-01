import 'package:flutter_base_module_1/data/local/weather_module_1_database.dart';
import 'package:flutter_base_module_1/data/models/weather_module_1_model.dart';
import 'package:injectable/injectable.dart';

@singleton
class WeatherModule1Repo {
  final WeatherModule1Database _db;

  WeatherModule1Repo({required WeatherModule1Database db}) : _db = db;

  Future<WeatherModule1Model?> getLastWeather() async {
    final weathers = await _db.weatherModule1Dao.getWeather1s();
    if (weathers.isEmpty) {
      return null;
    } else {
      return weathers.last;
    }
  }

  saveWeather(WeatherModule1Model model) {
    _db.weatherModule1Dao.add(model);
  }

  Stream<List<WeatherModule1Model>> getWeathers() {
    return _db.weatherModule1Dao.getWeathersStream();
  }
}
