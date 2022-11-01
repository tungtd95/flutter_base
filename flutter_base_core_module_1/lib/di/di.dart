import 'package:flutter_base_core_module_1/data/local/weather_core_database.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

GetIt? getItCoreModule;

@InjectableInit(initializerName: r'$initGetIt')
Future<void> configureBaseCore1Dependencies({
  required GetIt getIt,
  required String env,
}) async {
  final db = await $FloorWeatherCoreDatabase
      .databaseBuilder("weather_core.db")
      .build();
  getIt.registerSingleton<WeatherCoreDatabase>(db);
  $initGetIt(getIt, environment: env);
  getItCoreModule = getIt;
}
