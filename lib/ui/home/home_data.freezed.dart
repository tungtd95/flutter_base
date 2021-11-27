// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeDataTearOff {
  const _$HomeDataTearOff();

  _HomeData call(
      {Status status = const Status.init(),
      List<City>? cities,
      List<WeatherCity>? weathers}) {
    return _HomeData(
      status: status,
      cities: cities,
      weathers: weathers,
    );
  }
}

/// @nodoc
const $HomeData = _$HomeDataTearOff();

/// @nodoc
mixin _$HomeData {
  Status get status => throw _privateConstructorUsedError;
  List<City>? get cities => throw _privateConstructorUsedError;
  List<WeatherCity>? get weathers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeDataCopyWith<HomeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeDataCopyWith<$Res> {
  factory $HomeDataCopyWith(HomeData value, $Res Function(HomeData) then) =
      _$HomeDataCopyWithImpl<$Res>;
  $Res call({Status status, List<City>? cities, List<WeatherCity>? weathers});

  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class _$HomeDataCopyWithImpl<$Res> implements $HomeDataCopyWith<$Res> {
  _$HomeDataCopyWithImpl(this._value, this._then);

  final HomeData _value;
  // ignore: unused_field
  final $Res Function(HomeData) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? cities = freezed,
    Object? weathers = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      cities: cities == freezed
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>?,
      weathers: weathers == freezed
          ? _value.weathers
          : weathers // ignore: cast_nullable_to_non_nullable
              as List<WeatherCity>?,
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
abstract class _$HomeDataCopyWith<$Res> implements $HomeDataCopyWith<$Res> {
  factory _$HomeDataCopyWith(_HomeData value, $Res Function(_HomeData) then) =
      __$HomeDataCopyWithImpl<$Res>;
  @override
  $Res call({Status status, List<City>? cities, List<WeatherCity>? weathers});

  @override
  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class __$HomeDataCopyWithImpl<$Res> extends _$HomeDataCopyWithImpl<$Res>
    implements _$HomeDataCopyWith<$Res> {
  __$HomeDataCopyWithImpl(_HomeData _value, $Res Function(_HomeData) _then)
      : super(_value, (v) => _then(v as _HomeData));

  @override
  _HomeData get _value => super._value as _HomeData;

  @override
  $Res call({
    Object? status = freezed,
    Object? cities = freezed,
    Object? weathers = freezed,
  }) {
    return _then(_HomeData(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      cities: cities == freezed
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>?,
      weathers: weathers == freezed
          ? _value.weathers
          : weathers // ignore: cast_nullable_to_non_nullable
              as List<WeatherCity>?,
    ));
  }
}

/// @nodoc

class _$_HomeData implements _HomeData {
  const _$_HomeData(
      {this.status = const Status.init(), this.cities, this.weathers});

  @JsonKey(defaultValue: const Status.init())
  @override
  final Status status;
  @override
  final List<City>? cities;
  @override
  final List<WeatherCity>? weathers;

  @override
  String toString() {
    return 'HomeData(status: $status, cities: $cities, weathers: $weathers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeData &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.cities, cities) &&
            const DeepCollectionEquality().equals(other.weathers, weathers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(cities),
      const DeepCollectionEquality().hash(weathers));

  @JsonKey(ignore: true)
  @override
  _$HomeDataCopyWith<_HomeData> get copyWith =>
      __$HomeDataCopyWithImpl<_HomeData>(this, _$identity);
}

abstract class _HomeData implements HomeData {
  const factory _HomeData(
      {Status status,
      List<City>? cities,
      List<WeatherCity>? weathers}) = _$_HomeData;

  @override
  Status get status;
  @override
  List<City>? get cities;
  @override
  List<WeatherCity>? get weathers;
  @override
  @JsonKey(ignore: true)
  _$HomeDataCopyWith<_HomeData> get copyWith =>
      throw _privateConstructorUsedError;
}
