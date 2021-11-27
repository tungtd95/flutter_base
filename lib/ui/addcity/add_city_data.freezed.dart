// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_city_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddCityDataTearOff {
  const _$AddCityDataTearOff();

  _AddCityData call({Status status = const Status.init(), List<City>? cities}) {
    return _AddCityData(
      status: status,
      cities: cities,
    );
  }
}

/// @nodoc
const $AddCityData = _$AddCityDataTearOff();

/// @nodoc
mixin _$AddCityData {
  Status get status => throw _privateConstructorUsedError;
  List<City>? get cities => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddCityDataCopyWith<AddCityData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCityDataCopyWith<$Res> {
  factory $AddCityDataCopyWith(
          AddCityData value, $Res Function(AddCityData) then) =
      _$AddCityDataCopyWithImpl<$Res>;
  $Res call({Status status, List<City>? cities});

  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class _$AddCityDataCopyWithImpl<$Res> implements $AddCityDataCopyWith<$Res> {
  _$AddCityDataCopyWithImpl(this._value, this._then);

  final AddCityData _value;
  // ignore: unused_field
  final $Res Function(AddCityData) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? cities = freezed,
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
abstract class _$AddCityDataCopyWith<$Res>
    implements $AddCityDataCopyWith<$Res> {
  factory _$AddCityDataCopyWith(
          _AddCityData value, $Res Function(_AddCityData) then) =
      __$AddCityDataCopyWithImpl<$Res>;
  @override
  $Res call({Status status, List<City>? cities});

  @override
  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class __$AddCityDataCopyWithImpl<$Res> extends _$AddCityDataCopyWithImpl<$Res>
    implements _$AddCityDataCopyWith<$Res> {
  __$AddCityDataCopyWithImpl(
      _AddCityData _value, $Res Function(_AddCityData) _then)
      : super(_value, (v) => _then(v as _AddCityData));

  @override
  _AddCityData get _value => super._value as _AddCityData;

  @override
  $Res call({
    Object? status = freezed,
    Object? cities = freezed,
  }) {
    return _then(_AddCityData(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      cities: cities == freezed
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>?,
    ));
  }
}

/// @nodoc

class _$_AddCityData implements _AddCityData {
  const _$_AddCityData({this.status = const Status.init(), this.cities});

  @JsonKey(defaultValue: const Status.init())
  @override
  final Status status;
  @override
  final List<City>? cities;

  @override
  String toString() {
    return 'AddCityData(status: $status, cities: $cities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddCityData &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.cities, cities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(cities));

  @JsonKey(ignore: true)
  @override
  _$AddCityDataCopyWith<_AddCityData> get copyWith =>
      __$AddCityDataCopyWithImpl<_AddCityData>(this, _$identity);
}

abstract class _AddCityData implements AddCityData {
  const factory _AddCityData({Status status, List<City>? cities}) =
      _$_AddCityData;

  @override
  Status get status;
  @override
  List<City>? get cities;
  @override
  @JsonKey(ignore: true)
  _$AddCityDataCopyWith<_AddCityData> get copyWith =>
      throw _privateConstructorUsedError;
}
