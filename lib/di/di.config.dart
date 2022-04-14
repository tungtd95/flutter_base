// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;
import 'package:socket_io_client/socket_io_client.dart' as _i10;

import '../data/local/pref.dart' as _i8;
import '../data/local/weather_database.dart' as _i14;
import '../data/repo/ticker_repo.dart' as _i11;
import '../data/repo/weather_repo.dart' as _i13;
import '../data/service/weather_service.dart' as _i12;
import '../data/utils/exception_handler.dart' as _i6;
import '../env_config.dart' as _i5;
import '../ui/home/home_cubit.dart' as _i17;
import '../ui/sample/addcity/add_city_cubit.dart' as _i15;
import '../ui/sample/citydetails/city_details_cubit.dart' as _i16;
import '../ui/sample/learn/external_wallet_repo.dart' as _i7;
import 'data_module.dart' as _i3;

const String _prod = 'prod';
const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dataModule = _$DataModule();
  gh.singleton<_i3.AliceWrapper>(_i3.AliceProd(), registerFor: {_prod});
  gh.singleton<_i3.AliceWrapper>(_i3.AliceDev(), registerFor: {_dev});
  gh.lazySingleton<_i4.Dio>(() => dataModule.dio);
  gh.factory<_i5.Env>(() => _i5.EnvDEV(), registerFor: {_dev});
  gh.factory<_i5.Env>(() => _i5.EnvPROD(), registerFor: {_prod});
  gh.factory<_i6.ErrorHandler>(() => _i6.ErrorHandler());
  gh.factory<_i3.ErrorHandlerInterceptor>(() => _i3.ErrorHandlerInterceptor());
  gh.singleton<_i7.ExternalWalletRepo>(_i7.ExternalWalletRepo());
  gh.factory<List<_i4.Interceptor>>(() => dataModule.loggingInterceptorDev,
      registerFor: {_dev});
  gh.factory<List<_i4.Interceptor>>(() => dataModule.loggingInterceptorProd,
      registerFor: {_prod});
  gh.factory<_i8.Pref>(
      () => _i8.Pref(sharedPreferences: get<_i9.SharedPreferences>()));
  gh.singleton<_i10.Socket>(dataModule.socketIO);
  gh.singleton<_i11.TickerRepo>(_i11.TickerRepo(socketIO: get<_i10.Socket>()));
  gh.factory<_i12.WeatherService>(() => dataModule.weatherService);
  gh.factory<_i13.WeatherRepo>(() => _i13.WeatherRepo(
      service: get<_i12.WeatherService>(),
      weatherDatabase: get<_i14.WeatherDatabase>(),
      env: get<_i5.Env>()));
  gh.factory<_i15.AddCityCubit>(() => _i15.AddCityCubit(
      weatherRepo: get<_i13.WeatherRepo>(),
      errorHandler: get<_i6.ErrorHandler>(),
      tickerRepo: get<_i11.TickerRepo>()));
  gh.factory<_i16.CityDetailsCubit>(() => _i16.CityDetailsCubit(
      weatherRepo: get<_i13.WeatherRepo>(),
      errorHandler: get<_i6.ErrorHandler>()));
  gh.factory<_i17.HomeCubit>(() => _i17.HomeCubit(
      weatherRepo: get<_i13.WeatherRepo>(),
      pref: get<_i8.Pref>(),
      errorHandler: get<_i6.ErrorHandler>(),
      tickerRepo: get<_i11.TickerRepo>()));
  return get;
}

class _$DataModule extends _i3.DataModule {}
