import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/models/weather.dart';
import 'package:flutter_base/data/models/weather_city.dart';
import 'package:flutter_base/data/repo/weather_repo.dart';
import 'package:flutter_base/data/utils/exception_handler.dart';
import 'package:flutter_base/ui/sample/citydetails/city_details_cubit.dart';
import 'package:flutter_base/ui/sample/citydetails/city_details_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'city_details_cubit_test.mocks.dart';

@GenerateMocks([ErrorHandler, WeatherRepo])
void main() {
  late ErrorHandler errorHandler;
  late WeatherRepo weatherRepo;
  final weatherCityResult = WeatherCity(city: City(), weather: Weather());

  setUp(() {
    errorHandler = MockErrorHandler();
    weatherRepo = MockWeatherRepo();
  });

  blocTest<CityDetailsCubit, CityDetailsData>(
    'get weather by city id',
    setUp: () {
      when(weatherRepo.getWeatherByCityId(1))
          .thenAnswer((realInvocation) async => weatherCityResult);
    },
    build: () => CityDetailsCubit(
      errorHandler: errorHandler,
      weatherRepo: weatherRepo,
    ),
    act: (cubit) => cubit.getWeatherByCityId(1),
    verify: (bloc) {
      expect(weatherCityResult, equals(bloc.state.weather));
      verify(weatherRepo.getWeatherByCityId(1)).called(1);
    }
  );
}
