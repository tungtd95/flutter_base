import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/models/weather.dart';
import 'package:flutter_base/data/service/weather_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class WeatherRepo {
  WeatherService service;

  WeatherRepo({required this.service});

  Future<List<City>> searchCitiesByName(String query) {
    return service.getCitiesByName(query);
  }

  Future<Weather> getWeatherByCity(City city) {
    return service.getWeatherByCityLatLng(city.lat, city.lon);
  }
}
