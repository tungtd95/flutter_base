// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'city_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CityDetailsStateTearOff {
  const _$CityDetailsStateTearOff();

  _CityDetailsState call(
      {Status status = const Status.init(), WeatherCity? weather}) {
    return _CityDetailsState(
      status: status,
      weather: weather,
    );
  }
}

/// @nodoc
const $CityDetailsState = _$CityDetailsStateTearOff();

/// @nodoc
mixin _$CityDetailsState {
  Status get status => throw _privateConstructorUsedError;
  WeatherCity? get weather => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CityDetailsStateCopyWith<CityDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityDetailsStateCopyWith<$Res> {
  factory $CityDetailsStateCopyWith(
          CityDetailsState value, $Res Function(CityDetailsState) then) =
      _$CityDetailsStateCopyWithImpl<$Res>;
  $Res call({Status status, WeatherCity? weather});

  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class _$CityDetailsStateCopyWithImpl<$Res>
    implements $CityDetailsStateCopyWith<$Res> {
  _$CityDetailsStateCopyWithImpl(this._value, this._then);

  final CityDetailsState _value;
  // ignore: unused_field
  final $Res Function(CityDetailsState) _then;

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
abstract class _$CityDetailsStateCopyWith<$Res>
    implements $CityDetailsStateCopyWith<$Res> {
  factory _$CityDetailsStateCopyWith(
          _CityDetailsState value, $Res Function(_CityDetailsState) then) =
      __$CityDetailsStateCopyWithImpl<$Res>;
  @override
  $Res call({Status status, WeatherCity? weather});

  @override
  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class __$CityDetailsStateCopyWithImpl<$Res>
    extends _$CityDetailsStateCopyWithImpl<$Res>
    implements _$CityDetailsStateCopyWith<$Res> {
  __$CityDetailsStateCopyWithImpl(
      _CityDetailsState _value, $Res Function(_CityDetailsState) _then)
      : super(_value, (v) => _then(v as _CityDetailsState));

  @override
  _CityDetailsState get _value => super._value as _CityDetailsState;

  @override
  $Res call({
    Object? status = freezed,
    Object? weather = freezed,
  }) {
    return _then(_CityDetailsState(
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

class _$_CityDetailsState implements _CityDetailsState {
  const _$_CityDetailsState({this.status = const Status.init(), this.weather});

  @JsonKey(defaultValue: const Status.init())
  @override
  final Status status;
  @override
  final WeatherCity? weather;

  @override
  String toString() {
    return 'CityDetailsState(status: $status, weather: $weather)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CityDetailsState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.weather, weather) || other.weather == weather));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, weather);

  @JsonKey(ignore: true)
  @override
  _$CityDetailsStateCopyWith<_CityDetailsState> get copyWith =>
      __$CityDetailsStateCopyWithImpl<_CityDetailsState>(this, _$identity);
}

abstract class _CityDetailsState implements CityDetailsState {
  const factory _CityDetailsState({Status status, WeatherCity? weather}) =
      _$_CityDetailsState;

  @override
  Status get status;
  @override
  WeatherCity? get weather;
  @override
  @JsonKey(ignore: true)
  _$CityDetailsStateCopyWith<_CityDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
