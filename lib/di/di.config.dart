// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/local/weather_database.dart' as _i6;
import '../data/repo/weather_repo.dart' as _i5;
import '../data/service/weather_service.dart' as _i4;
import '../ui/addcity/add_city_cubit.dart' as _i7;
import '../ui/citydetails/city_details_cubit.dart' as _i8;
import '../ui/home/home_cubit.dart' as _i9;
import 'data_module.dart' as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dataModule = _$DataModule();
  gh.lazySingleton<_i3.Dio>(() => dataModule.dio);
  gh.factory<_i4.WeatherService>(() => dataModule.weatherService);
  gh.factory<_i5.WeatherRepo>(() => _i5.WeatherRepo(
      service: get<_i4.WeatherService>(),
      weatherDatabase: get<_i6.WeatherDatabase>()));
  gh.factory<_i7.AddCityCubit>(
      () => _i7.AddCityCubit(weatherRepo: get<_i5.WeatherRepo>()));
  gh.factory<_i8.CityDetailsCubit>(
      () => _i8.CityDetailsCubit(weatherRepo: get<_i5.WeatherRepo>()));
  gh.factory<_i9.HomeCubit>(
      () => _i9.HomeCubit(weatherRepo: get<_i5.WeatherRepo>()));
  return get;
}

class _$DataModule extends _i10.DataModule {}
