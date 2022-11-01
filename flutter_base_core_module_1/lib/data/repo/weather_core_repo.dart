import 'package:flutter_base_core_module_1/data/local/weather_core_database.dart';
import 'package:flutter_base_core_module_1/data/models/weather_core_model.dart';
import 'package:injectable/injectable.dart';

@singleton
class WeatherCoreRepo {
  WeatherCoreDatabase _coreDatabase;

  WeatherCoreRepo({
    required WeatherCoreDatabase coreDatabase,
  }) : _coreDatabase = coreDatabase;

  saveLastCity(WeatherCoreModel city) {
    _coreDatabase.weatherCoreModelDao.add(city);
  }

  Future<WeatherCoreModel?> getLastCity() async {
    final weathers =
        await _coreDatabase.weatherCoreModelDao.getWeatherCoreModels();
    if (weathers.isNotEmpty) {
      return weathers.last;
    } else {
      return null;
    }
  }

  Stream<List<WeatherCoreModel>> getWeathers() {
    return _coreDatabase.weatherCoreModelDao.getWeathersStream();
  }
}
