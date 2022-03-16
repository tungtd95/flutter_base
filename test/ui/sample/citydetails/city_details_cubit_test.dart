import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/models/weather.dart';
import 'package:flutter_base/data/models/weather_city.dart';
import 'package:flutter_base/data/repo/weather_repo.dart';
import 'package:flutter_base/data/utils/base_exception.dart';
import 'package:flutter_base/data/utils/exception_handler.dart';
import 'package:flutter_base/ui/base/status.dart';
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

  group('get city details', () {
    blocTest<CityDetailsCubit, CityDetailsData>(
      'get weather by city id success',
      build: () => CityDetailsCubit(
        errorHandler: errorHandler,
        weatherRepo: weatherRepo,
      ),
      setUp: () {
        when(weatherRepo.getWeatherByCityId(1))
            .thenAnswer((realInvocation) async => weatherCityResult);
      },
      act: (cubit) => cubit.getWeatherByCityId(1),
      verify: (cubit) {
        verify(weatherRepo.getWeatherByCityId(1)).called(1);
        expect(weatherCityResult, cubit.state.weather);
        expect(true, cubit.state.status is Success);
      },
    );
  });

  blocTest<CityDetailsCubit, CityDetailsData>('get weather by city id failed',
      build: () => CityDetailsCubit(
            errorHandler: errorHandler,
            weatherRepo: weatherRepo,
          ),
      setUp: () {
        when(weatherRepo.getWeatherByCityId(1))
            .thenAnswer((realInvocation) async => throw Exception());
        when(errorHandler.parse(any)).thenReturn(BaseException());
      },
      act: (cubit) => cubit.getWeatherByCityId(1),
      verify: (cubit) {
        verify(weatherRepo.getWeatherByCityId(1)).called(1);
        expect(true, cubit.state.status is Error);
      });
}
