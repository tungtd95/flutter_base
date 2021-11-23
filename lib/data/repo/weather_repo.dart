import 'package:flutter_base/data/local/weather_database.dart';
import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/models/weather.dart';
import 'package:flutter_base/data/service/weather_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class WeatherRepo {
  WeatherService _service;
  WeatherDatabase _weatherDatabase;

  WeatherRepo({
    required WeatherService service,
    required WeatherDatabase weatherDatabase,
  })  : this._service = service,
        this._weatherDatabase = weatherDatabase;

  Future<List<City>> searchCitiesByName(String query) {
    return _service.getCitiesByName(query);
  }

  Future<Weather> getWeatherByCity(City city) {
    return _service.getWeatherByCityLatLng(city.lat, city.lon);
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
