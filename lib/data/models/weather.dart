import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  final WeatherMain? main;
  @JsonKey(name: 'weather')
  final List<WeatherInfo>? weathers;

  Weather({this.main, this.weathers});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  List<Object?> get props => [main, weathers];
}

@JsonSerializable()
class WeatherMain extends Equatable {
  final double? temp;
  final double? pressure;
  final double? humidity;

  WeatherMain({this.temp, this.pressure, this.humidity});

  factory WeatherMain.fromJson(Map<String, dynamic> json) =>
      _$WeatherMainFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherMainToJson(this);

  @override
  List<Object?> get props => [temp, pressure, humidity];
}

@JsonSerializable()
class WeatherInfo extends Equatable {
  final String? main;
  final String? description;
  final String? icon;

  WeatherInfo({this.main, this.description, this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherInfoToJson(this);

  String getWeatherIconUrl() {
    if (icon == null || icon!.isEmpty) {
      return '';
    } else {
      return 'https://openweathermap.org/img/wn/$icon@2x.png';
    }
  }

  @override
  List<Object?> get props => [main, description, icon];
}
