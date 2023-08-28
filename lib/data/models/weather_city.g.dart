// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherCity _$WeatherCityFromJson(Map<String, dynamic> json) => WeatherCity(
      city: City.fromJson(json['city'] as Map<String, dynamic>),
      weather: Weather.fromJson(json['weather'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherCityToJson(WeatherCity instance) =>
    <String, dynamic>{
      'weather': instance.weather.toJson(),
      'city': instance.city.toJson(),
    };
