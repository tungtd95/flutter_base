import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:floor/floor.dart';

part 'weather_module_1_model.g.dart';

@JsonSerializable()
@Entity(tableName: 'weather_module_1_model')
class WeatherModule1Model {
  @PrimaryKey(autoGenerate: false)
  int id;
  String location;
  String status;
  String icon;
  String temp;
  String humidity;

  WeatherModule1Model({
    required this.id,
    required this.location,
    required this.status,
    required this.icon,
    required this.temp,
    required this.humidity,
  });

  factory WeatherModule1Model.fromJson(Map<String, dynamic> json) =>
      _$WeatherModule1ModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModule1ModelToJson(this);

  factory WeatherModule1Model.random() {
    int newWeatherId = DateTime.now().millisecondsSinceEpoch;
    int stateFake = Random().nextInt(5);
    switch (stateFake) {
      case 0:
        return WeatherModule1Model(
          id: newWeatherId,
          location: 'london',
          status: '$stateFake',
          icon: 'icon',
          temp: '1',
          humidity: '2',
        );
      case 1:
        return WeatherModule1Model(
          id: newWeatherId,
          location: 'hanoi',
          status: '$stateFake',
          icon: 'icon',
          temp: '3',
          humidity: '4',
        );
      case 2:
        return WeatherModule1Model(
          id: newWeatherId,
          location: 'moskva',
          status: '$stateFake',
          icon: 'icon',
          temp: '5',
          humidity: '6',
        );
      case 3:
        return WeatherModule1Model(
          id: newWeatherId,
          location: 'new york',
          status: '$stateFake',
          icon: 'icon',
          temp: '7',
          humidity: '8',
        );
      default:
        throw Exception('Weather unknown');
    }
  }
}
