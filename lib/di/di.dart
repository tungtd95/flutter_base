import 'package:flutter/material.dart';
import 'package:flutter_base/data/local/weather_database.dart';
import 'package:flutter_base_config/di/di.dart';
import 'package:flutter_base_core_module_1/di/di.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies({required String env}) async {
  await configureBaseConfigDependencies(getIt: getIt, env: env);
  await configureBaseCore1Dependencies(getIt: getIt, env: env);
  await configDatabase();
  await configPref();
  getIt.registerSingleton<RouteObserver<ModalRoute<void>>>(
    RouteObserver<ModalRoute<void>>(),
  );
  $initGetIt(getIt, environment: env);
}

Future<void> configDatabase() async {
  final db = await $FloorWeatherDatabase.databaseBuilder("weather.db").build();
  getIt.registerSingleton<WeatherDatabase>(db);
}

Future<void> configPref() async {
  final SharedPreferences _prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(_prefs);
}
