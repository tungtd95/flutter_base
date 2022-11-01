import 'dart:async';
import 'dart:math';

import 'package:flutter_base_core_module_1/data/models/weather_core_model.dart';
import 'package:flutter_base_core_module_1/data/repo/weather_core_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class WeatherManager {
  BehaviorSubject<WeatherState> weatherStateSubject =
      BehaviorSubject.seeded(WeatherState.unknown);
  final WeatherCoreRepo _weatherCoreRepo;
  WeatherCoreModel? _weatherCoreModel;

  WeatherManager({required WeatherCoreRepo weatherCoreRepo})
      : _weatherCoreRepo = weatherCoreRepo {
    _initWeather();
  }

  _initWeather() {
    _revive();
    // fire new weather state every 5 seconds
    Timer.periodic(const Duration(seconds: 5), (timer) {
      weatherStateSubject.value = _getWeatherRandom();
      try {
        _weatherCoreModel = WeatherCoreModel.random(weatherStateSubject.value);
        _sync();
      } catch (e) {
        // ignore
      }
    });
  }

  _getWeatherRandom() => WeatherState.values
      .elementAt(Random().nextInt(WeatherState.values.length));

  getWeatherInfo() => _weatherCoreModel;

  _revive() async {
    _weatherCoreModel = await _weatherCoreRepo.getLastCity();
  }

  _sync() {
    if (_weatherCoreModel != null) {
      _weatherCoreRepo.saveLastCity(_weatherCoreModel!);
    }
  }
}

enum WeatherState {
  cloudy,
  sunny,
  rain,
  snow,
  unknown,
}
