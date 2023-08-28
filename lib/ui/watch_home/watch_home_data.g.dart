// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_home_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WatchHomeDataCWProxy {
  WatchHomeData status(Status? status);

  WatchHomeData weather(WeatherCity? weather);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WatchHomeData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WatchHomeData(...).copyWith(id: 12, name: "My name")
  /// ````
  WatchHomeData call({
    Status? status,
    WeatherCity? weather,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWatchHomeData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWatchHomeData.copyWith.fieldName(...)`
class _$WatchHomeDataCWProxyImpl implements _$WatchHomeDataCWProxy {
  const _$WatchHomeDataCWProxyImpl(this._value);

  final WatchHomeData _value;

  @override
  WatchHomeData status(Status? status) => this(status: status);

  @override
  WatchHomeData weather(WeatherCity? weather) => this(weather: weather);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WatchHomeData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WatchHomeData(...).copyWith(id: 12, name: "My name")
  /// ````
  WatchHomeData call({
    Object? status = const $CopyWithPlaceholder(),
    Object? weather = const $CopyWithPlaceholder(),
  }) {
    return WatchHomeData(
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

extension $WatchHomeDataCopyWith on WatchHomeData {
  /// Returns a callable class that can be used as follows: `instanceOfWatchHomeData.copyWith(...)` or like so:`instanceOfWatchHomeData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WatchHomeDataCWProxy get copyWith => _$WatchHomeDataCWProxyImpl(this);
}
