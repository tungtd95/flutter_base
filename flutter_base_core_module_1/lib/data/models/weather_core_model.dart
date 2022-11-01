import 'package:flutter_base_core_module_1/manager/weather_manager.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:floor/floor.dart';

part 'weather_core_model.g.dart';

@JsonSerializable()
@Entity(tableName: 'weather_core_model')
class WeatherCoreModel {
  @PrimaryKey(autoGenerate: false)
  int id;
  String location;
  String status;
  String icon;
  String temp;
  String humidity;

  WeatherCoreModel({
    required this.id,
    required this.location,
    required this.status,
    required this.icon,
    required this.temp,
    required this.humidity,
  });

  factory WeatherCoreModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherCoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherCoreModelToJson(this);

  factory WeatherCoreModel.random(WeatherState state) {
    int newWeatherId = DateTime.now().millisecondsSinceEpoch;
    switch (state) {
      case WeatherState.cloudy:
        return WeatherCoreModel(
          id: newWeatherId,
          location: 'london',
          status: state.name,
          icon: 'icon',
          temp: '1',
          humidity: '2',
        );
      case WeatherState.rain:
        return WeatherCoreModel(
          id: newWeatherId,
          location: 'hanoi',
          status: state.name,
          icon: 'icon',
          temp: '3',
          humidity: '4',
        );
      case WeatherState.snow:
        return WeatherCoreModel(
          id: newWeatherId,
          location: 'moskva',
          status: state.name,
          icon: 'icon',
          temp: '5',
          humidity: '6',
        );
      case WeatherState.sunny:
        return WeatherCoreModel(
          id: newWeatherId,
          location: 'new york',
          status: state.name,
          icon: 'icon',
          temp: '7',
          humidity: '8',
        );
      case WeatherState.unknown:
        throw Exception('Weather unknown');
    }
  }
}
