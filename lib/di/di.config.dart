// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../data/local/pref.dart' as _i7;
import '../data/local/weather_database.dart' as _i11;
import '../data/repo/weather_repo.dart' as _i10;
import '../data/service/weather_service.dart' as _i9;
import '../data/utils/exception_handler.dart' as _i5;
import '../env_config.dart' as _i4;
import '../ui/addcity/add_city_cubit.dart' as _i12;
import '../ui/citydetails/city_details_cubit.dart' as _i13;
import '../ui/home/home_cubit.dart' as _i14;
import 'data_module.dart' as _i6;

const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dataModule = _$DataModule();
  gh.lazySingleton<_i3.Dio>(() => dataModule.dio);
  gh.factory<_i4.Env>(() => _i4.EnvDEV(), registerFor: {_dev});
  gh.factory<_i4.Env>(() => _i4.EnvPROD(), registerFor: {_prod});
  gh.factory<_i5.ErrorHandler>(() => _i5.ErrorHandler());
  gh.factory<_i6.ErrorHandlerInterceptor>(() => _i6.ErrorHandlerInterceptor());
  gh.factory<List<_i3.Interceptor>>(() => dataModule.loggingInterceptorDev,
      registerFor: {_dev});
  gh.factory<List<_i3.Interceptor>>(() => dataModule.loggingInterceptorProd,
      registerFor: {_prod});
  gh.factory<_i7.Pref>(
      () => _i7.Pref(sharedPreferences: get<_i8.SharedPreferences>()));
  gh.factory<_i9.WeatherService>(() => dataModule.weatherService);
  gh.factory<_i10.WeatherRepo>(() => _i10.WeatherRepo(
      service: get<_i9.WeatherService>(),
      weatherDatabase: get<_i11.WeatherDatabase>(),
      env: get<_i4.Env>()));
  gh.factory<_i12.AddCityCubit>(() => _i12.AddCityCubit(
      weatherRepo: get<_i10.WeatherRepo>(),
      errorHandler: get<_i5.ErrorHandler>()));
  gh.factory<_i13.CityDetailsCubit>(() => _i13.CityDetailsCubit(
      weatherRepo: get<_i10.WeatherRepo>(),
      errorHandler: get<_i5.ErrorHandler>()));
  gh.factory<_i14.HomeCubit>(() => _i14.HomeCubit(
      weatherRepo: get<_i10.WeatherRepo>(),
      pref: get<_i7.Pref>(),
      errorHandler: get<_i5.ErrorHandler>()));
  return get;
}

class _$DataModule extends _i6.DataModule {}
