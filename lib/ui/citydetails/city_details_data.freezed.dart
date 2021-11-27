// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'city_details_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CityDetailsDataTearOff {
  const _$CityDetailsDataTearOff();

  _CityDetailsData call(
      {Status status = const Status.init(), WeatherCity? weather}) {
    return _CityDetailsData(
      status: status,
      weather: weather,
    );
  }
}

/// @nodoc
const $CityDetailsData = _$CityDetailsDataTearOff();

/// @nodoc
mixin _$CityDetailsData {
  Status get status => throw _privateConstructorUsedError;
  WeatherCity? get weather => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CityDetailsDataCopyWith<CityDetailsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityDetailsDataCopyWith<$Res> {
  factory $CityDetailsDataCopyWith(
          CityDetailsData value, $Res Function(CityDetailsData) then) =
      _$CityDetailsDataCopyWithImpl<$Res>;
  $Res call({Status status, WeatherCity? weather});

  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class _$CityDetailsDataCopyWithImpl<$Res>
    implements $CityDetailsDataCopyWith<$Res> {
  _$CityDetailsDataCopyWithImpl(this._value, this._then);

  final CityDetailsData _value;
  // ignore: unused_field
  final $Res Function(CityDetailsData) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? weather = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      weather: weather == freezed
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as WeatherCity?,
    ));
  }

  @override
  $StatusCopyWith<$Res> get status {
    return $StatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value));
    });
  }
}

/// @nodoc
abstract class _$CityDetailsDataCopyWith<$Res>
    implements $CityDetailsDataCopyWith<$Res> {
  factory _$CityDetailsDataCopyWith(
          _CityDetailsData value, $Res Function(_CityDetailsData) then) =
      __$CityDetailsDataCopyWithImpl<$Res>;
  @override
  $Res call({Status status, WeatherCity? weather});

  @override
  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class __$CityDetailsDataCopyWithImpl<$Res>
    extends _$CityDetailsDataCopyWithImpl<$Res>
    implements _$CityDetailsDataCopyWith<$Res> {
  __$CityDetailsDataCopyWithImpl(
      _CityDetailsData _value, $Res Function(_CityDetailsData) _then)
      : super(_value, (v) => _then(v as _CityDetailsData));

  @override
  _CityDetailsData get _value => super._value as _CityDetailsData;

  @override
  $Res call({
    Object? status = freezed,
    Object? weather = freezed,
  }) {
    return _then(_CityDetailsData(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      weather: weather == freezed
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as WeatherCity?,
    ));
  }
}

/// @nodoc

class _$_CityDetailsData implements _CityDetailsData {
  const _$_CityDetailsData({this.status = const Status.init(), this.weather});

  @JsonKey(defaultValue: const Status.init())
  @override
  final Status status;
  @override
  final WeatherCity? weather;

  @override
  String toString() {
    return 'CityDetailsData(status: $status, weather: $weather)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CityDetailsData &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.weather, weather) || other.weather == weather));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, weather);

  @JsonKey(ignore: true)
  @override
  _$CityDetailsDataCopyWith<_CityDetailsData> get copyWith =>
      __$CityDetailsDataCopyWithImpl<_CityDetailsData>(this, _$identity);
}

abstract class _CityDetailsData implements CityDetailsData {
  const factory _CityDetailsData({Status status, WeatherCity? weather}) =
      _$_CityDetailsData;

  @override
  Status get status;
  @override
  WeatherCity? get weather;
  @override
  @JsonKey(ignore: true)
  _$CityDetailsDataCopyWith<_CityDetailsData> get copyWith =>
      throw _privateConstructorUsedError;
}
