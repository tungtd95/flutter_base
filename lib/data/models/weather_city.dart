import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/models/weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_city.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherCity {
  final Weather weather;
  final City city;

  WeatherCity({required this.city, required this.weather});

  factory WeatherCity.fromJson(Map<String, dynamic> json) =>
      _$WeatherCityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherCityToJson(this);
}
