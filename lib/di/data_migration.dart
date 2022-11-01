import 'package:floor/floor.dart';
import 'package:flutter_base/di/di.dart';
import 'package:flutter_base_core_module_1/data/local/weather_core_database.dart';
import 'package:flutter_base_core_module_1/data/models/weather_core_model.dart';
import 'package:flutter_base_module_1/data/local/weather_module_1_database.dart';
import 'package:flutter_base_module_1/data/models/weather_module_1_model.dart';

mixin DataMigration {
  static Migration migration1to2 = Migration(1, 2, (database) async {
    final data = await database.query('city');
    final weatherCoreDb = getIt<WeatherCoreDatabase>();
    final weatherModule1Db = getIt<WeatherModule1Database>();

    for (final city in data) {
      int id = (city['id'] as int?) ?? 0;
      String name = (city['name'] as String?) ?? '';
      String country = (city['country'] as String?) ?? '';
      String state = (city['state'] as String?) ?? '';

      weatherCoreDb.weatherCoreModelDao.add(WeatherCoreModel(
        id: id,
        location: country,
        icon: name,
        status: state,
        humidity: '0',
        temp: '0',
      ));

      weatherModule1Db.weatherModule1Dao.add(WeatherModule1Model(
        id: id,
        location: name,
        status: state,
        icon: country,
        temp: '1',
        humidity: '1',
      ));
    }
  });
}
