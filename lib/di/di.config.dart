// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../data/local/pref.dart' as _i7;
import '../data/local/weather_database.dart' as _i11;
import '../data/repo/weather_repo.dart' as _i10;
import '../data/service/weather_service.dart' as _i9;
import '../data/utils/exception_handler.dart' as _i6;
import '../env_config.dart' as _i5;
import '../ui/home/home_cubit.dart' as _i14;
import '../ui/sample/addcity/add_city_cubit.dart' as _i12;
import '../ui/sample/citydetails/city_details_cubit.dart' as _i13;
import 'data_module.dart' as _i3;

const String _prod = 'prod';
const String _dev = 'dev';

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dataModule = _$DataModule();
  gh.singleton<_i3.AliceWrapper>(
    _i3.AliceProd(),
    registerFor: {_prod},
  );
  gh.singleton<_i3.AliceWrapper>(
    _i3.AliceDev(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i4.Dio>(() => dataModule.dio);
  gh.factory<_i5.Env>(
    () => _i5.EnvDEV(),
    registerFor: {_dev},
  );
  gh.factory<_i5.Env>(
    () => _i5.EnvPROD(),
    registerFor: {_prod},
  );
  gh.factory<_i6.ErrorHandler>(() => _i6.ErrorHandler());
  gh.factory<_i3.ErrorHandlerInterceptor>(() => _i3.ErrorHandlerInterceptor());
  gh.factory<List<_i4.Interceptor>>(
    () => dataModule.loggingInterceptorDev,
    registerFor: {_dev},
  );
  gh.factory<List<_i4.Interceptor>>(
    () => dataModule.loggingInterceptorProd,
    registerFor: {_prod},
  );
  gh.factory<_i7.Pref>(
      () => _i7.Pref(sharedPreferences: gh<_i8.SharedPreferences>()));
  gh.factory<_i9.WeatherService>(() => dataModule.weatherService);
  gh.factory<_i10.WeatherRepo>(() => _i10.WeatherRepo(
        service: gh<_i9.WeatherService>(),
        weatherDatabase: gh<_i11.WeatherDatabase>(),
        env: gh<_i5.Env>(),
      ));
  gh.factory<_i12.AddCityCubit>(() => _i12.AddCityCubit(
        weatherRepo: gh<_i10.WeatherRepo>(),
        errorHandler: gh<_i6.ErrorHandler>(),
      ));
  gh.factory<_i13.CityDetailsCubit>(() => _i13.CityDetailsCubit(
        weatherRepo: gh<_i10.WeatherRepo>(),
        errorHandler: gh<_i6.ErrorHandler>(),
      ));
  gh.factory<_i14.HomeCubit>(() => _i14.HomeCubit(
        weatherRepo: gh<_i10.WeatherRepo>(),
        pref: gh<_i7.Pref>(),
        errorHandler: gh<_i6.ErrorHandler>(),
      ));
  return getIt;
}

class _$DataModule extends _i3.DataModule {}
