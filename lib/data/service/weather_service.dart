import 'package:dio/dio.dart';
import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/models/weather.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_service.g.dart';

@RestApi()
abstract class WeatherService {
  factory WeatherService(Dio dio, {String baseUrl}) = _WeatherService;

  @GET("/data/2.5/weather")
  Future<Weather> getWeatherByCityLatLng(
    @Query("lat") double? lat,
    @Query("lon") double? lon,
    @Query("appid") String appid,
  );

  @GET("/geo/1.0/direct")
  Future<List<City>> getCitiesByName(
    @Query("q") String cityName,
    @Query("appid") String appid, {
    @Query("limit") int limit = 5,
  });
}
