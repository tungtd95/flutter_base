// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_details_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CityDetailsDataCWProxy {
  CityDetailsData status(Status? status);

  CityDetailsData weather(WeatherCity? weather);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CityDetailsData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CityDetailsData(...).copyWith(id: 12, name: "My name")
  /// ````
  CityDetailsData call({
    Status? status,
    WeatherCity? weather,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCityDetailsData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCityDetailsData.copyWith.fieldName(...)`
class _$CityDetailsDataCWProxyImpl implements _$CityDetailsDataCWProxy {
  const _$CityDetailsDataCWProxyImpl(this._value);

  final CityDetailsData _value;

  @override
  CityDetailsData status(Status? status) => this(status: status);

  @override
  CityDetailsData weather(WeatherCity? weather) => this(weather: weather);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CityDetailsData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CityDetailsData(...).copyWith(id: 12, name: "My name")
  /// ````
  CityDetailsData call({
    Object? status = const $CopyWithPlaceholder(),
    Object? weather = const $CopyWithPlaceholder(),
  }) {
    return CityDetailsData(
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as Status?,
      weather: weather == const $CopyWithPlaceholder()
          ? _value.weather
          // ignore: cast_nullable_to_non_nullable
          : weather as WeatherCity?,
    );
  }
}

extension $CityDetailsDataCopyWith on CityDetailsData {
  /// Returns a callable class that can be used as follows: `instanceOfCityDetailsData.copyWith(...)` or like so:`instanceOfCityDetailsData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CityDetailsDataCWProxy get copyWith => _$CityDetailsDataCWProxyImpl(this);
}
