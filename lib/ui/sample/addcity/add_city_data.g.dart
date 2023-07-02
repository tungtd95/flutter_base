// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_city_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddCityDataCWProxy {
  AddCityData status(Status? status);

  AddCityData cities(List<City>? cities);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddCityData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddCityData(...).copyWith(id: 12, name: "My name")
  /// ````
  AddCityData call({
    Status? status,
    List<City>? cities,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddCityData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddCityData.copyWith.fieldName(...)`
class _$AddCityDataCWProxyImpl implements _$AddCityDataCWProxy {
  const _$AddCityDataCWProxyImpl(this._value);

  final AddCityData _value;

  @override
  AddCityData status(Status? status) => this(status: status);

  @override
  AddCityData cities(List<City>? cities) => this(cities: cities);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddCityData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddCityData(...).copyWith(id: 12, name: "My name")
  /// ````
  AddCityData call({
    Object? status = const $CopyWithPlaceholder(),
    Object? cities = const $CopyWithPlaceholder(),
  }) {
    return AddCityData(
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as Status?,
      cities: cities == const $CopyWithPlaceholder()
          ? _value.cities
          // ignore: cast_nullable_to_non_nullable
          : cities as List<City>?,
    );
  }
}

extension $AddCityDataCopyWith on AddCityData {
  /// Returns a callable class that can be used as follows: `instanceOfAddCityData.copyWith(...)` or like so:`instanceOfAddCityData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddCityDataCWProxy get copyWith => _$AddCityDataCWProxyImpl(this);
}
