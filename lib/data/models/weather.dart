import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  WeatherMain? main;
  @JsonKey(name: 'weather')
  List<WeatherInfo>? weathers;

  Weather({this.main, this.weathers});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class WeatherMain {
  double? temp;
  double? pressure;
  double? humidity;

  WeatherMain({this.temp, this.pressure, this.humidity});

  factory WeatherMain.fromJson(Map<String, dynamic> json) =>
      _$WeatherMainFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherMainToJson(this);
}

@JsonSerializable()
class WeatherInfo {
  String? main;
  String? description;
  String? icon;

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
}
