// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_module_1_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModule1Model _$WeatherModule1ModelFromJson(Map<String, dynamic> json) =>
    WeatherModule1Model(
      id: json['id'] as int,
      location: json['location'] as String,
      status: json['status'] as String,
      icon: json['icon'] as String,
      temp: json['temp'] as String,
      humidity: json['humidity'] as String,
    );

Map<String, dynamic> _$WeatherModule1ModelToJson(
        WeatherModule1Model instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'status': instance.status,
      'icon': instance.icon,
      'temp': instance.temp,
      'humidity': instance.humidity,
    };
