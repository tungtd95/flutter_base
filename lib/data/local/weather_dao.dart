import 'package:floor/floor.dart';
import 'package:flutter_base/data/models/city.dart';

@dao
abstract class WeatherDao {

  @Query("SELECT * FROM city")
  Stream<List<City>> getCitiesStream();

  @Query("SELECT * FROM city")
  Future<List<City>> getCitiesOneShot();

  @Query("SELECT * FROM city WHERE id=:cityId")
  Future<City?> getCityById(int cityId);

  @insert
  Future<void> add(City city);

  @delete
  Future<void> remove(City city);
}