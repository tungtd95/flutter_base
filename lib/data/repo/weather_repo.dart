import 'package:flutter_base/data/local/weather_database.dart';
import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/models/weather.dart';
import 'package:flutter_base/data/models/weather_city.dart';
import 'package:flutter_base/data/service/weather_service.dart';
import 'package:flutter_base/env_config.dart';
import 'package:injectable/injectable.dart';

@injectable
class WeatherRepo {
  WeatherService _service;
  WeatherDatabase _weatherDatabase;
  Env _env;

  WeatherRepo({
    required WeatherService service,
    required WeatherDatabase weatherDatabase,
    required Env env,
  })  : this._service = service,
        this._weatherDatabase = weatherDatabase,
        this._env = env;

  Future<List<City>> searchCitiesByName(String query) {
    return _service.getCitiesByName(
      query,
      _env.getOpenWeatherAppID(),
    );
  }

  Future<Weather> getWeatherByCity(City city) {
    return _service.getWeatherByCityLatLng(
      city.lat,
      city.lon,
      _env.getOpenWeatherAppID(),
    );
  }

  Future<WeatherCity?> getWeatherByCityId(int cityId) async {
    final City? city = await _weatherDatabase.weatherDao.getCityById(cityId);
    if (city == null) return null;
    final Weather? weather = await _service.getWeatherByCityLatLng(
      city.lat,
      city.lon,
      _env.getOpenWeatherAppID(),
    );
    if (weather != null) {
      return WeatherCity(city: city, weather: weather);
    } else {
      return null;
    }
  }

  Stream<List<City>> getCitiesStream() {
    return _weatherDatabase.weatherDao.getCitiesStream();
  }

  Future<void> addCity(City city) async {
    List<City> currentCity = [];
    await _weatherDatabase.weatherDao.getCitiesOneShot().then(
      (value) {
        currentCity = value;
      },
      onError: (e) {
        currentCity = [];
      },
    );
    if (currentCity
        .any((element) => element.getFullName() == city.getFullName())) {
      return Future.value();
    } else {
      return _weatherDatabase.weatherDao.add(city);
    }
  }

  Future<void> removeCity(City city) {
    return _weatherDatabase.weatherDao.remove(city);
  }
}
