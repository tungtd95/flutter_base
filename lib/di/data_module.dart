import 'package:flutter_base/data/service/weather_service.dart';
import 'package:flutter_base/di/di.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@module
abstract class DataModule {
  @lazySingleton
  Dio get dio {
    final Dio dio = Dio();
    return dio;
  }

  @injectable
  WeatherService get weatherService {
    return WeatherService(
      getIt<Dio>(),
      baseUrl: "https://api.openweathermap.org",
    );
  }
}
