import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/models/weather.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'weather_service.g.dart';

@RestApi()
abstract class WeatherService {
  factory WeatherService(Dio dio, {String baseUrl}) = _WeatherService;

  @GET("/data/2.5/weather?appid=1f930c31692eff97a92281d72455c44a")
  Future<Weather> getWeatherByCityLatLng(
    @Query("lat") double? lat,
    @Query("lon") double? lon,
  );

  @GET("/geo/1.0/direct?appid=1f930c31692eff97a92281d72455c44a")
  Future<List<City>> getCitiesByName(
    @Query("q") String cityName, {
    @Query("limit") int limit = 5,
  });
}
