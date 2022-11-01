import 'package:flutter_base_module_1/data/local/weather_module_1_database.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

GetIt? getItModule1;

@InjectableInit(initializerName: r'$initGetIt')
Future<void> configureBaseModule1Dependencies({
  required GetIt getIt,
  required String env,
}) async {
  final db = await $FloorWeatherModule1Database
      .databaseBuilder("weather_module_1.db")
      .build();
  getIt.registerSingleton<WeatherModule1Database>(db);

  $initGetIt(getIt, environment: env);
  getItModule1 = getIt;
}
