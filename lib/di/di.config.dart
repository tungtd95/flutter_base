// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../data/local/pref.dart' as _i5;
import '../data/local/weather_database.dart' as _i9;
import '../data/repo/weather_repo.dart' as _i8;
import '../data/service/weather_service.dart' as _i7;
import '../data/utils/exception_handler.dart' as _i4;
import '../ui/addcity/add_city_cubit.dart' as _i10;
import '../ui/citydetails/city_details_cubit.dart' as _i11;
import '../ui/home/home_cubit.dart' as _i12;
import 'data_module.dart' as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dataModule = _$DataModule();
  gh.lazySingleton<_i3.Dio>(() => dataModule.dio);
  gh.factory<_i4.ErrorHandler>(() => _i4.ErrorHandler());
  gh.factory<_i5.Pref>(
      () => _i5.Pref(sharedPreferences: get<_i6.SharedPreferences>()));
  gh.factory<_i7.WeatherService>(() => dataModule.weatherService);
  gh.factory<_i8.WeatherRepo>(() => _i8.WeatherRepo(
      service: get<_i7.WeatherService>(),
      weatherDatabase: get<_i9.WeatherDatabase>()));
  gh.factory<_i10.AddCityCubit>(() => _i10.AddCityCubit(
      weatherRepo: get<_i8.WeatherRepo>(),
      errorHandler: get<_i4.ErrorHandler>()));
  gh.factory<_i11.CityDetailsCubit>(() => _i11.CityDetailsCubit(
      weatherRepo: get<_i8.WeatherRepo>(),
      errorHandler: get<_i4.ErrorHandler>()));
  gh.factory<_i12.HomeCubit>(() => _i12.HomeCubit(
      weatherRepo: get<_i8.WeatherRepo>(), pref: get<_i5.Pref>()));
  return get;
}

class _$DataModule extends _i13.DataModule {}
