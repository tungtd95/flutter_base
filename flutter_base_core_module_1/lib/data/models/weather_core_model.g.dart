// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_core_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherCoreModel _$WeatherCoreModelFromJson(Map<String, dynamic> json) =>
    WeatherCoreModel(
      id: json['id'] as int,
      location: json['location'] as String,
      status: json['status'] as String,
      icon: json['icon'] as String,
      temp: json['temp'] as String,
      humidity: json['humidity'] as String,
    );

Map<String, dynamic> _$WeatherCoreModelToJson(WeatherCoreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'status': instance.status,
      'icon': instance.icon,
      'temp': instance.temp,
      'humidity': instance.humidity,
    };
