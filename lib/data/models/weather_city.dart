import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/models/weather.dart';

class WeatherCity {
  Weather weather;
  City city;

  WeatherCity({required this.city, required this.weather});
}
