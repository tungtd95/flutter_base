import 'dart:async';
import 'dart:math';

import 'package:flutter_base_core_module_1/data/models/weather_core_model.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class WeatherManager {
  BehaviorSubject<WeatherState> weatherStateSubject =
      BehaviorSubject.seeded(WeatherState.unknown);

  WeatherManager() {
    _initWeather();
  }

  _initWeather() {
    // fire new weather state every 5 seconds
    Timer.periodic(const Duration(seconds: 5), (timer) {
      weatherStateSubject.value = _getWeatherRandom();
    });
  }

  _getWeatherRandom() => WeatherState.values
      .elementAt(Random().nextInt(WeatherState.values.length));

  getWeatherInfo() => WeatherCoreModel.random(weatherStateSubject.value);
}

enum WeatherState {
  cloudy,
  sunny,
  rain,
  snow,
  unknown,
}
