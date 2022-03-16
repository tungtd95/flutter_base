// Mocks generated by Mockito 5.0.17 from annotations
// in flutter_base/test/ui/sample/citydetails/city_details_cubit_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;

import 'package:dio/dio.dart' as _i5;
import 'package:flutter_base/data/models/city.dart' as _i8;
import 'package:flutter_base/data/models/weather.dart' as _i3;
import 'package:flutter_base/data/models/weather_city.dart' as _i9;
import 'package:flutter_base/data/repo/weather_repo.dart' as _i6;
import 'package:flutter_base/data/utils/base_exception.dart' as _i2;
import 'package:flutter_base/data/utils/exception_handler.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeBaseException_0 extends _i1.Fake implements _i2.BaseException {}

class _FakeWeather_1 extends _i1.Fake implements _i3.Weather {}

/// A class which mocks [ErrorHandler].
///
/// See the documentation for Mockito's code generation for more information.
class MockErrorHandler extends _i1.Mock implements _i4.ErrorHandler {
  MockErrorHandler() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.BaseException parse(dynamic e) =>
      (super.noSuchMethod(Invocation.method(#parse, [e]),
          returnValue: _FakeBaseException_0()) as _i2.BaseException);
  @override
  void dioErrorParser(_i5.DioError? err) =>
      super.noSuchMethod(Invocation.method(#dioErrorParser, [err]),
          returnValueForMissingStub: null);
}

/// A class which mocks [WeatherRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherRepo extends _i1.Mock implements _i6.WeatherRepo {
  MockWeatherRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i8.City>> searchCitiesByName(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchCitiesByName, [query]),
              returnValue: Future<List<_i8.City>>.value(<_i8.City>[]))
          as _i7.Future<List<_i8.City>>);
  @override
  _i7.Future<_i3.Weather> getWeatherByCity(_i8.City? city) =>
      (super.noSuchMethod(Invocation.method(#getWeatherByCity, [city]),
              returnValue: Future<_i3.Weather>.value(_FakeWeather_1()))
          as _i7.Future<_i3.Weather>);
  @override
  _i7.Future<_i9.WeatherCity?> getWeatherByCityId(int? cityId) =>
      (super.noSuchMethod(Invocation.method(#getWeatherByCityId, [cityId]),
              returnValue: Future<_i9.WeatherCity?>.value())
          as _i7.Future<_i9.WeatherCity?>);
  @override
  _i7.Stream<List<_i8.City>> getCitiesStream() =>
      (super.noSuchMethod(Invocation.method(#getCitiesStream, []),
              returnValue: Stream<List<_i8.City>>.empty())
          as _i7.Stream<List<_i8.City>>);
  @override
  _i7.Future<void> addCity(_i8.City? city) =>
      (super.noSuchMethod(Invocation.method(#addCity, [city]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> removeCity(_i8.City? city) =>
      (super.noSuchMethod(Invocation.method(#removeCity, [city]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<String> getRemoteFlavor() =>
      (super.noSuchMethod(Invocation.method(#getRemoteFlavor, []),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
}