import 'package:equatable/equatable.dart';
import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/models/weather.dart';

class WeatherCity extends Equatable {
  final Weather weather;
  final City city;

  WeatherCity({required this.city, required this.weather});

  @override
  List<Object?> get props => [weather, city];
}
