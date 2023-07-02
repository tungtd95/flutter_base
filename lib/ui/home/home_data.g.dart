// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HomeDataCWProxy {
  HomeData status(Status? status);

  HomeData cities(List<City>? cities);

  HomeData weathers(List<WeatherCity>? weathers);

  HomeData remoteFlavor(String? remoteFlavor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeData(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeData call({
    Status? status,
    List<City>? cities,
    List<WeatherCity>? weathers,
    String? remoteFlavor,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHomeData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHomeData.copyWith.fieldName(...)`
class _$HomeDataCWProxyImpl implements _$HomeDataCWProxy {
  const _$HomeDataCWProxyImpl(this._value);

  final HomeData _value;

  @override
  HomeData status(Status? status) => this(status: status);

  @override
  HomeData cities(List<City>? cities) => this(cities: cities);

  @override
  HomeData weathers(List<WeatherCity>? weathers) => this(weathers: weathers);

  @override
  HomeData remoteFlavor(String? remoteFlavor) =>
      this(remoteFlavor: remoteFlavor);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeData(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeData call({
    Object? status = const $CopyWithPlaceholder(),
    Object? cities = const $CopyWithPlaceholder(),
    Object? weathers = const $CopyWithPlaceholder(),
    Object? remoteFlavor = const $CopyWithPlaceholder(),
  }) {
    return HomeData(
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as Status?,
      cities: cities == const $CopyWithPlaceholder()
          ? _value.cities
          // ignore: cast_nullable_to_non_nullable
          : cities as List<City>?,
      weathers: weathers == const $CopyWithPlaceholder()
          ? _value.weathers
          // ignore: cast_nullable_to_non_nullable
          : weathers as List<WeatherCity>?,
      remoteFlavor: remoteFlavor == const $CopyWithPlaceholder()
          ? _value.remoteFlavor
          // ignore: cast_nullable_to_non_nullable
          : remoteFlavor as String?,
    );
  }
}

extension $HomeDataCopyWith on HomeData {
  /// Returns a callable class that can be used as follows: `instanceOfHomeData.copyWith(...)` or like so:`instanceOfHomeData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HomeDataCWProxy get copyWith => _$HomeDataCWProxyImpl(this);
}
